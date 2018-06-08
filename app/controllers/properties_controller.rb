class PropertiesController < ApplicationController

    def index
      @properties = Property.search("*", page: params[:page], per_page: 3, where: conditions)
    end
  
    def show
      @property = Property.find(params[:id])
    end

    private

    def conditions
      set_filters
      get_filters || {}
    end

    def set_filters
      filters = [
        :l,
        :near,
        :type,
        :tab, # param for availability -> for sale / rent
        :area,
        :price,
        :parking,
        :bathrooms,
        :bedrooms
      ]

      session[:filters] = {}

      params.keys.map(&:to_sym).each do |key|
        method(key).call if filters.include?(key)
      end
    end


    def get_filters
      return if session[:filters].nil?
      filters = session[:filters].deep_symbolize_keys
      filters[:price] = string_to_range(filters[:price]) if session[:filters]['price']
      filters[:area] = string_to_range(filters[:area]) if session[:filters]['area']
      return filters
    end


    def l
      sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
      location = {
        location: {
          top_left: {
            lat: ne_lat,
            lon: sw_lng
          },
          bottom_right: {
            lat: sw_lat,
            lon: ne_lng
            }
          }
        }
      session[:filters].merge!(location)
    end


    def near
      return if params[:near].blank?
      session[:neartext] = params[:near]
      near = Geocoder.search(params[:near]).first
      location = {
        location: {
          near: {
            lat: near.latitude,
            lon: near.longitude
            },
            within: "100mi"
          }
        }
        session[:filters].merge!(location)
    end

    def tab
      availability = params[:tab]
      return session[:filters].delete('availability') if availability == 'any'
      session[:filters]['availability'] = availability if availability.present?
    end


    def price
      min = params[:price][:min].to_i
      max = params[:price][:max].to_i
      return session[:filters].delete('price') if (min.zero? && max.zero?)

      max = max.zero? ? (1.0 / 0.0) : params[:price][:max].to_i
      session[:filters].merge!(price: min..max)
    end


    def area
      min = params[:area][:min].to_i
      max = params[:area][:max].to_i
      return session[:filters].delete('area') if (min.zero? && max.zero?)

      max = max.zero? ? (1.0 / 0.0) : params[:area][:max].to_i
      session[:filters].merge!(area: min..max)
    end


    def type
      type = params[:type]
      return session[:filters].delete('type') if type == 'any'
      session[:filters]['type'] = type if type.present?
    end


    def bedrooms
      bedrooms = params[:bedrooms]
      return session[:filters].delete('bedrooms') if bedrooms.to_i.zero?
      session[:filters]['bedrooms'] = bedrooms
    end


    def bathrooms
      bathrooms = params[:bathrooms]
      return session[:filters].delete('bathrooms') if bathrooms.to_i.zero?
      session[:filters]['bathrooms'] = bathrooms
    end


    def parking
      parking = params[:parking]
      return if parking.to_i.zero?
      session[:filters].merge!(parking: parking)
    end

    def string_to_range(value)
      return if value.nil?
      return value unless value.class == String
      range = value.split('..').map{|d| (d=="Infinity") ? 1.0 / 0 : Integer(d)}
      range[0]..range[1]
    end

end

# _TODO
# boost_by_distance: {
#   location: {
#     origin: {
#       lat: location.latitude,
#       lon: location.longitude
#       }
#     }
#   }

class PropertiesController < ApplicationController

  def index
    @conditions = {}
    set_filters
    @properties = Property.search("*", page: params[:page], per_page: 5, where: @conditions)
  end

  private
    def set_filters
      filters = [
        "l",
        "near",
        "type",
        "price",
        "parking",
        "bathrooms",
        "bedrooms"
      ]

      params.keys.each do |key|
        method(key.to_sym).call if filters.include?(key)
      end
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
      @conditions.merge!(location)
    end


    def near
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
        @conditions.merge!(location)
    end


    def price
      min = params[:price][:min].to_i
      max = params[:price][:max].to_i.zero? ? (1.0 / 0.0) : params[:price][:max].to_i
      @conditions.merge!(price: min..max)
    end


    def type
      @conditions.merge!(type: params[:type].keys)
    end


    def bedrooms
      min = params[:bedrooms][:min].to_i
      max = params[:bedrooms][:max].to_i.zero? ? (1.0 / 0.0) : params[:bedrooms][:max].to_i
      @conditions.merge!(bedrooms: min..max)
    end


    def bathrooms
      bathrooms = params[:bathrooms]
      return if bathrooms.to_i.zero?
      @conditions.merge!(bathrooms: bathrooms)
    end
    

    def parking
      parking = params[:parking]
      return if parking.to_i.zero?
      @conditions.merge!(parking: parking)
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

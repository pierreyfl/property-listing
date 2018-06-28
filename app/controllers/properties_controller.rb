class PropertiesController < ApplicationController


    def index
      @saved_searches = Search.all # _TODO current_user.searches

      if params[:search_id].presence
        search = Search.find(params[:search_id])
        session[:filters] = search.conditions
        session[:neartext] = search.near
      end

      @properties = Property.search("*", page: params[:page], per_page: 3, where: conditions)
    end

    def show
      @property = Property.find(params[:id])
    end

    def my_properties
      @properties = current_user.properties
    end

    def listing
    end

    def new
      @property = current_user.properties.build
    end
    
    def edit 
      @property = current_user.properties.find(params[:id])
    end

    def create
      @property = current_user.properties.build(property_params)
      if @property.save
        redirect_to root_path, notice: "Saved..."
      else
        flash[:alert] = "Something went wrong..."
        render :new
      end
    end

    
    def update
      @property = current_user.properties.find(params[:id])
      if @property.update_attributes(property_params)
        #handle successful update
        redirect_to my_properties_path(current_user), notice: "Saved..."
      else
        render 'edit'
      end
    end
    
    def destroy
        Property.find(params[:id]).destroy
        flash[:success] = "Property deleted."
        redirect_to my_properties_url
      end


    private

    def conditions
      set_filters unless params[:search_id]
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
        :bedrooms,
        :country
      ]

      session[:filters] = {}

      params.keys.map(&:to_sym).each do |key|
        method(key).call if filters.include?(key)
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
      return session[:filters].delete(:availability) if availability == 'any'
      session[:filters][:availability] = availability if availability.present?
    end


    def price
      min = params[:price][:min].to_i
      max = params[:price][:max].to_i
      return session[:filters].delete(:price) if (min.zero? && max.zero?)

      max = max.zero? ? (1.0 / 0.0) : params[:price][:max].to_i
      session[:filters].merge!(price: min..max)
    end


    def area
      min = params[:area][:min].to_i
      max = params[:area][:max].to_i
      return session[:filters].delete(:area) if (min.zero? && max.zero?)

      max = max.zero? ? (1.0 / 0.0) : params[:area][:max].to_i
      session[:filters].merge!(area: min..max)
    end


    def type
      type = params[:type]
      return session[:filters].delete(:type) if type == 'any'
      session[:filters][:type] = type if type.present?
    end


    def bedrooms
      bedrooms = params[:bedrooms]
      return session[:filters].delete(:bedrooms) if bedrooms.to_i.zero?
      session[:filters][:bedrooms] = bedrooms
    end


    def bathrooms
      bathrooms = params[:bathrooms]
      return session[:filters].delete(:bathrooms) if bathrooms.to_i.zero?
      session[:filters][:bathrooms] = bathrooms
    end


    def parking
      parking = params[:parking]
      return if parking.to_i.zero?
      session[:filters].merge!(parking: parking)
    end

    def country
      country = CS.countries[params[:country].to_sym]

      return if country.blank?
      state   =  params[:state]
      city    = params[:city]
      near = [country, state, city].reject(&:blank?).join(', ')
      session[:neartext] = near
      near = Geocoder.search(near).first

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

    def property_params
      params.require(:property).permit(:name, :area, :bedrooms, :bathrooms, :description, :parking, :address, :city, :state, :zip, :building_age, :type, :longitude, :latitude, :availability, :price)
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

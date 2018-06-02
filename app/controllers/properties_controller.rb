class PropertiesController < ApplicationController

  def index
    @properties = if params[:l]
                    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")

                    Property.search("*", page: params[:page], per_page: 6, where: {
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
                      })
                  elsif params[:near]
                    location = Geocoder.search(params[:near]).first
                    Property.search "*", page: params[:page], per_page: 6,
                    boost_by_distance: {
                      location: {
                        origin: {
                          lat: location.latitude,
                          lon: location.longitude
                          }
                        }
                      },
                    where: {
                      location: {
                        near: {
                          lat: location.latitude,
                          lon: location.longitude
                          },
                          within: "100mi"
                        }
                      }
                  else
                    Property.all.page(params[:page]).per(6)
                  end
  end

end

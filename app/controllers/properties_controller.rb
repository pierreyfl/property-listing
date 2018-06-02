class PropertiesController < ApplicationController

  def index
    @properties = if params[:near]
                    Property.near(params[:near])
                  else
                    Property.all
                  end
    @properties = @properties.page(params[:page]).per(6)
  end

end

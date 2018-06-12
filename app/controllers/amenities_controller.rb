class AmenitiesController < ApplicationController
  def index
    package = PropertyPackage.find(params[:package_id])
    render json: package.amenities
  end

  def destroy
    Amenity.delete(params[:id])
  end

  def update
    a = Amenity.find(params[:id])
    a.name = params[:name]
    a.available = params[:available]


    if a.save!
      render json: a and return
    end

    render json: a.errors, status: :unprocessable_entity
  end

  def create
    a = Amenity.new
    a.name = params[:name]
    a.available = params[:available]
    a.property_package_id = params[:package_id]


    if a.save!
      render json: a and return
    end

    render json: a.errors, status: :unprocessable_entity
  end
end
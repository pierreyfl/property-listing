class PagesController < ApplicationController

  def index

    query = params[:q].presence || '*'

    @conditions = {}
    filters = ["type", "price", "parking", "bathrooms", "bedrooms"]

    params.keys.each do |key|
      method(key.to_sym).call if filters.include?(key)
    end

    @properties = Property.search query, where: @conditions

  end

  private

    def type
      @conditions.merge!(type: params[:type].keys)
    end

    def price
      min = params[:price][:min].to_i
      max = params[:price][:max].blank? ? (1.0 / 0.0) : params[:price][:max].to_i
      @conditions.merge!(price: min..max)
    end

    def bathrooms
      bathrooms = params[:bathrooms]
      return if bathrooms.blank?
      @conditions.merge!(bathrooms: bathrooms)
    end

    def bedrooms
      min = params[:bedrooms][:min].to_i
      max = params[:bedrooms][:max].blank? ? (1.0 / 0.0) : params[:bedrooms][:max].to_i
      @conditions.merge!(bedrooms: min..max)
    end

    def parking
      parking = params[:parking]
      return if parking.blank?
      @conditions.merge!(parking: parking)
    end

end

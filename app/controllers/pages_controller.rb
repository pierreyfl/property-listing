class PagesController < ApplicationController

  def index

    query = params[:q].presence || '*'

    @conditions = {}
    filters = ["type", "price", "parking", "bathrooms"]

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

end

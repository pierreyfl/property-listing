class PagesController < ApplicationController

  def index
    query = params[:q].presence || '*'
    conditions = {}
    conditions[:type] = params[:type].keys if params[:type]

    @properties = Property.search query, where: conditions
  end

end

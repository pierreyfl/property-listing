class PagesController < ApplicationController

  def index
    query = params[:q].presence || '*'
    conditions = params[:type]

    @rooms = Room.search(query)
  end

end

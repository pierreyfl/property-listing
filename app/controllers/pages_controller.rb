class PagesController < ApplicationController

  def index
    query = params[:q].presence || '*'
    @rooms = Room.search(query)
  end

end

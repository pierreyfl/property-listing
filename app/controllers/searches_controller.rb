class SearchesController < ApplicationController

  def create
    Search.create do |s|
      s.conditions = get_filters
      s.near = session[:neartext]
      s.results = params[:results_found]
      s.user = User.last # _TODO current_user
    end

    @saved_searches = Search.all # _TODO current_user.searches
  end


  def destroy
    search = Search.find(params[:id])
    search.destroy
  end

end

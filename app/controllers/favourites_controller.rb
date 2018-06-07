class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
    current_user.like! target
    redirect_back fallback_location: root_path, notice: "Added to favourites"
  end

  def destroy
    target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
    current_user.unlike! target
    redirect_back fallback_location: root_path, notice: "Removed from favourites"
  end
end

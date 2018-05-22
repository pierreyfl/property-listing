class AgenciesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authenticate_super_admin, except: [:show]
  def index
    @agencies = Agency.all
  end

  def new
  end
  
  def show
    @room = Room.find(params[:id])
    @photos = @room.photos
    @guest_reviews = @room.guest_reviews
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def create
    email = agency_params[:email]
    user = User.find_by(email: email)
    unless user.present?
      flash[:error] = "Can't find user, please inform agency admin register for an account first"
      redirect_to '/' and return
    end

    user.transaction do
      agency = Agency.create!(agency_params)
      user.update!(userable: agency)
      user.add_role(:agency_admin, agency)
    end
    redirect_to agencies_path
  end

  private
  def agency_params
    params.require(:agency)
    .permit(
      :email,
      :name,
      :description,
      :contact_no,
      :private,
      :location,
      :cover_photo
    )
  end

  def authenticate_super_admin
    # only super_admin can do agency creation and other operations
    unless current_user.has_role? :super_admin
      flash[:error] = "You don't have permission!"
      redirect_to dashboard_path
    end

  end

end

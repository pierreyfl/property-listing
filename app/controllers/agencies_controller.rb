class AgenciesController < ApplicationController

  def index
    @agencies = Agency.all.page(params[:page]).per(3)
  end

  def show
    @contact = Contact.new
    @agency = Agency.find(params[:id])
    @properties = @agency.properties.page(params[:page]).per(3)
  end

  def edit
    @agency = Agency.find(params[:id])
    @agency.social_links.build if @agency.social_links.none?
  end

  def update
    @agency = Agency.find(params[:id])
    if @agency.update(agency_params)
      redirect_to dashboard_path
    else
      # _TODO errors
    end
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
    params.require(:agency).permit(
      :email,
      :name,
      :city,
      :country,
      :state,
      :zipcode,
      :phone_number,
      :photo,
      :cover_photo,
      social_links_attributes: [:id, :site, :url, :_destroy]
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

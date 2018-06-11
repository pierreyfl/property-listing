class AgenciesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_super_admin
  def index
    @agencies = Agency.all.page(params[:page]).per(3)
  end

  def show
    @contact = Contact.new
    @agency = Agency.find(params[:id])
    @properties = Property.all.page(params[:page]).per(3)
    # @properties = @agency.properties.page(params[:page]).per(3)
  end

  def new
  end

  def create
    email = agency_params[:email]
    user = User.find_by(email: email)
    unless user.present?
      flash[:error] = "Can't find user, please inform agency admin register for an account first"
      redirect_to '/' and return
    end

    user.transaction do
      agency = Agency.create!(name: agency_params[:name])
      user.update!(userable: agency)
      user.add_role(:agency_admin, agency)
    end
    redirect_to agencies_path
  end

  private
  def agency_params
    params.require(:agency).permit(:email, :name)
  end

  def authenticate_super_admin
    # only super_admin can do agency creation and other operations
    unless current_user.has_role? :super_admin
      flash[:error] = "You don't have permission!"
      redirect_to dashboard_path
    end

  end

end

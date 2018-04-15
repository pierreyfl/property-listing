class AgencyRolesController < ApplicationController
  before_action :current_agency, only: [:index, :create]
  def index
    redirect_to new_user_session_path and return unless current_user && current_user.has_role?(:agency_admin, @current_agency)
    @roles = current_agency.roles
  end

  def new
  end

  def create
    role = Role.new(name: role_params[:name], resource_id: @current_agency.id, resource_type: @current_agency.class.name)
    if role.save
      flash[:success] = "Successfully add role to your agency"
      redirect_to agency_roles_path
    else
      flash[:error] = "Failed to add role to your agency, Please try again later"
    end
  end

  private
  def role_params
    params.require(:agency_role).permit(:name)
  end

end

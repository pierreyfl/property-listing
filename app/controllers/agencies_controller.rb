class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all
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

end

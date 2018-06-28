class RegistrationsController < Devise::RegistrationsController

  def new
    if params[:agency]
      session[:user_type] = 'Agency'
    elsif params[:agent]
      session[:user_type] = 'Agent'
    else
      session.delete(:user_type)
    end

    super
  end

  def create

    super do
      # _TODO get agency from params and find it in db
      # set agency for the agent
      resource.type = session[:user_type]
      resource.save
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    if resource.type == 'Agency'
      edit_agency_path(resource)
    else
      edit_user_registration_path(resource)
    end
  end
end

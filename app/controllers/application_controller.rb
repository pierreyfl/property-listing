class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description, :date_of_birth, :interested_location])
  end

  def current_agency
    # current_agency will return current logged user's agency, if the logged in user doesn't have +:agency_admin+ role, it will redirect to home
    unless current_user.roles.where(name: :agency_admin).exists?
      flash[:error] = "You dont have permission"
      redirect_to '/'
    end
    @current_agency ||= Agency.find_by(id: current_user.userable_id)
  end

  def current_agent
    @current_agent ||= Agent.find_by(id: current_user.userable_id)
  end

  def track_referer(trackable_id, trackable_type)
    referer = request.referer
    return if referer.nil?
    domain = get_domain(referer)
    page_view = PageView.find_or_initialize_by(domain: domain, trackable_id: trackable_id, trackable_type: trackable_type)
    page_view.count += 1
    page_view.save!
  end

  def get_domain(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

end

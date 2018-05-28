class AnalyticsController < ApplicationController

  def show

    id = session[:id] = params[:id] ? params[:id].to_i : session[:id]
    resource = session[:resource] = params[:resource] ? params[:resource] : session[:resource]

    @viewing_by   = params[:view_by] || "day"

    if ['room'].include?(resource)
      @impressions    = Ahoy::Event.impressions_by_hour(resource, id, @viewing_by)
      @visits         = Ahoy::Visit.visits_by_hour(resource, id, @viewing_by)
      @visitors       = Ahoy::Visit.visitors_by_country(resource, id, @viewing_by)
    end
  end

end

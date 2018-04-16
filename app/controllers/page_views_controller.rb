class PageViewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_agent, only: [:index]

  def index
    @page_views = current_agent.page_views
  end


  private
  def authenticate_agent
    unless current_user.has_role?(:agent, current_user.agency)
      flash[:error] = "You have no permission to operate"
      redirect_to '/'
    end
  end

end

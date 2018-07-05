class AgentsController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  before_action only: [:show] do
    track_referer(params[:id], 'Agent')
  end

  def show
    @agent = Agent.find(params[:id])
    @properties = @agent.properties.page(params[:page]).per(3)
  end

  def index
    if current_user.is_a? Agency
      @agents = current_user.agents.page(params[:page]).per(3)
      render 'dashboards/agents_list'
    else
      @q = Agent.ransack(params[:q])
      @agents = @q.result(distinct: true)
      if params["sort_agent"].present?
        if params["sort_agent"] == "Name (A to Z)"
          @agents = @agents.order(name: :asc)
        elsif params["sort_agency"] == "Name (Z to A)"
          @agents = @agents.order(name: :desc)          
        elsif params["sort_agency"] == "Most Properties for sale"
          @agents = @agents.order(num_of_sold_properties: :desc)        
        else
          @agents = @agents.order(num_of_rent_properties: :desc)
        end
      end
      @agents = @agents.page(params[:page]).per(3)
    end
  end

  def new
  end

  def create
    @agent = Agent.new(agent_params)
    @agent.agency = current_user

    if @agent.save
      redirect_to agents_path
    else
    end

  end

  private
  def agent_params
    params.require(:agent).permit(
      :email,
      :name,
      :password,
      :password_confirmation,
      :city,
      :country,
      :phone_number,
      :description,
      :state
    )
  end


  def authenticate_agency_admin
    unless current_user.has_role?(:agency_admin, current_agency)
      flash[:error] = "You have no permission to operate"
      redirect_to '/'
    end
  end

end

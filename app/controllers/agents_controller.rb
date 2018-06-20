class AgentsController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  # before_action :authenticate_agency_admin, except: [:show]
  before_action only: [:show] do
    track_referer(params[:id], 'Agent')
  end

  def show
    @agent = Agent.find(params[:id])
    @properties = @agent.properties.page(params[:page]).per(3)

  end

  def index
    # @agents = current_agency.agents
    @agents = Agent.all.page(params[:page]).per(3)
  end

  def new
    @roles = current_agency.roles
  end

  def create
    @user = User.find_by(email: agent_params[:email])
    unless @user.present?
      flash[:error] = "User doesn't exist, let agent register an account first"
      return redirect_to dashboard_path
    end

    region_info = process_region_info(agent_params)
    agent_params.merge!(region_info)
    @user.transaction do
      role = agent_params.delete(:role)

      agent = Agent.find_or_initialize_by(email: agent_params[:email])
      agent.update!(agent_params.merge(agency_id: current_agency.id))
      @user.update!(userable: agent)
      @user.add_role(role.to_sym, current_agency) unless @user.has_role?(role.to_sym, current_agency)
    end
    redirect_to agents_path
  end

  private
  def agent_params
    params.require(:agent).permit!
  end

  def process_region_info(params)
    country = params.fetch(:country)
    state = params.fetch(:state)
    city = params.fetch(:city)

    if country.present?
      if state.present?
        states_lookup = CS.get(country)
        state = states_lookup[state.to_sym]
      else
        country_lookup = CS.get
        country = country_lookup[country.to_sym]
      end
    end

    {country: country, state: state, city: city}
  end

  def authenticate_agency_admin
    unless current_user.has_role?(:agency_admin, current_agency)
      flash[:error] = "You have no permission to operate"
      redirect_to '/'
    end
  end

end

class AgentsController < ApplicationController
  def index
    @agents = current_agency.agents
  end

  def new
    @roles = current_agency.roles
  end

  def create
    @user = User.find_by(email: agent_params[:email])
    render :new unless @user.present?

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
end

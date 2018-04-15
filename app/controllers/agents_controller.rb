class AgentsController < ApplicationController
  def index
    @agents = current_agency.agents
  end

  def new
  end
end

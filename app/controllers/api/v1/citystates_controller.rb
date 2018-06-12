class Api::V1::CitystatesController < ActionController::API
  def index
      if params[:country]
        states = CS.states(params[:country])
        render json: { states: states.invert, status: :ok }
      elsif params[:state]
        cities = CS.cities(params[:state])
        render json: { cities: cities, status: :ok }
      end
    end
end

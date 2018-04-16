class RegionController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:search]

  def search
    # render state, city with giving country id, state id
    country = region_params[:country]
    state = region_params[:state]
    if country.present? && state.blank?
      @states = CS.states(country)
    end
    if country.present? && state.present?
      @cities = CS.cities(state, country)
    end

    respond_to do |format|
      format.js {render 'region_options'}
    end
  end

  private
  def region_params
    params.require(:region).permit(:country, :state)
  end
end

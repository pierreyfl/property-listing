class ListClassifiedsController < ApplicationController
  include Wicked::Wizard

  steps :company, :plan

  def show
    @classified_listing = ClassifiedListing.find(session[:listing_id])
    render_wizard
  end

  def update
    @classified_listing = ClassifiedListing.find(session[:listing_id])
    @classified_listing.attributes = classified_listing_params
    render_wizard @classified_listing
  end


  private
    def classified_listing_params
      params.require(:classified_listing).permit(
        {category_ids: []},
        :title,
        :description,
        :listing_plan_id,
        categories_attributes: [:id, :name, :_destroy],
        services_attributes: [:id, :name, :_destroy],
        company_attributes: [
          :name,
          :country,
          :state,
          :city,
          :street,
          :building,
          :zip_code,
          :email,
          :phone_number,
          :website,
          :logo
        ]
      )
    end

    def finish_wizard_path
      session.delete(:listing_id)
      root_path
    end

end

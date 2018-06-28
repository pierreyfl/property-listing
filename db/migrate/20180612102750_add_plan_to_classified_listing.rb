class AddPlanToClassifiedListing < ActiveRecord::Migration[5.1]
  def change
    add_reference :classified_listings, :listing_plan, foreign_key: true
  end
end

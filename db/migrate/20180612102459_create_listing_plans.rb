class CreateListingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_plans do |t|
      t.string :name
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end

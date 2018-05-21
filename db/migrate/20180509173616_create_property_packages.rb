class CreatePropertyPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :property_packages do |t|
      t.string :name
      t.string :string
      t.integer :listing_period
      t.decimal :price
      t.date :expiry_date
      t.integer :listings_amount
      t.boolean :is_standard
      t.boolean :is_premium
      t.boolean :is_feature
      t.boolean :is_single
      t.boolean :is_multi

      t.timestamps
    end
  end
end

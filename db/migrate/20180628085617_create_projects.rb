class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :country
      t.string :building_name
      t.string :street_address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.boolean :display_address
      t.string :title
      t.text :description
      t.text :key_features, array:true, default: []
      t.string :prefix
      t.string :currency
      t.decimal :price

      t.timestamps
    end
  end
end

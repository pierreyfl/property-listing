class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.belongs_to :classified_listing
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :building
      t.string :zip_code
      t.string :email
      t.string :phone_number
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end

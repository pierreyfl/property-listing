class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :photo
      t.string :cover_photo
      t.string :name
      t.string :title
      t.string :phone_number
      t.string :email
      t.integer :years_experience
      t.integer :agency_id
      t.string :description, limit: 500
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end

class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :year_of_birth, :integer
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
    add_column :users, :scenario, :string
    add_column :users, :income, :integer
    add_column :users, :country_w, :string
    add_column :users, :country_w2, :string
    add_column :users, :country_w3, :string
  end
end

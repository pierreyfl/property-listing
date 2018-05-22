class AddFieldsToAgencies < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :search_visibility, :integer, default: 0, null: false
    add_column :agencies, :location, :string
    add_column :agencies, :contact_no, :string
    add_column :agencies, :description, :text
    add_column :agencies, :email, :string
  end
end

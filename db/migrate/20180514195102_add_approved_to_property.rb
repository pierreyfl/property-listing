class AddApprovedToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :approved, :boolean
  end
end

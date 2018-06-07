class AddAreaToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :area, :decimal
  end
end

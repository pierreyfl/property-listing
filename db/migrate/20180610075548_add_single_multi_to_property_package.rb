class AddSingleMultiToPropertyPackage < ActiveRecord::Migration[5.1]
  def change
    add_column :property_packages, :single_multi, :string
  end
end

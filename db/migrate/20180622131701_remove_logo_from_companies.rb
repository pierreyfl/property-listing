class RemoveLogoFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :logo
  end
end

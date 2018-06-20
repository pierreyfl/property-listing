class AddWalletToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallet, :integer, :default => 0
  end
end

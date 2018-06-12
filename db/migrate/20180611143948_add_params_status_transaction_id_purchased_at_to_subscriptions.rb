class AddParamsStatusTransactionIdPurchasedAtToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :notification_params, :text
    add_column :subscriptions, :status, :string
    add_column :subscriptions, :transaction_id, :string
    add_column :subscriptions, :purchased_at, :datetime
  end
end

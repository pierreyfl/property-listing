class AddPropertyPackageToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :property_package, foreign_key: true
  end
end

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :property_package
  #serialize :notification_params, Hash
  scope :completed, -> { where(status: 'Completed') }
  after_update :add_to_wallet
  
  
  def paypal_url(return_path)
      values = {
          business: "merchant@gotealeaf.com",
          cmd: "_xclick",
          upload: 1,
          return: "#{Rails.application.secrets.app_host}#{return_path}",
          invoice: self.id + 1000,
          amount: 100,
          item_name: "yea",
          item_number: 2,
          quantity: '1',
          notify_url: "#{Rails.application.secrets.app_host}/hook"
      }
      "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
    end
    
    private
    
    def add_to_wallet
      if self.status == "Completed"
        self.user.update(wallet: self.user.wallet + self.property_package.listings_amount)
      end
    end
end
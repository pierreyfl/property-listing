class SubscriptionsController < AdminController
  protect_from_forgery except: [:hook]
  skip_before_action :track_ahoy_visit
  
  def hook
    puts status
    puts "HALEELUYAH"
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    puts status
    puts "HALEELUYAH"
    if status == "Completed"
      @registration = Subscription.find(params[:invoice].to_i - 1000)
      @registration.update(status: status, transaction_id: params[:txn_id], purchased_at: Time.now)
    end
    render nothing: true
  end
  
  def create
    @subscription = current_user.subscriptions.build(property_package_id: params[:package_id])
    if @subscription.save
      redirect_to @subscription.paypal_url(subscription_path(@subscription))
    else
      render :new
    end
  end
  
  def show
    @subscription = Subscription.find(params[:id])
  end
  
  def index
    @subscriptions = current_user.subscriptions.completed
  end
  
  private
  
  def subscription_params
    params.require(:subscription).permit(:package_id, :user_id, :status, :transaction_id, :purchased_at)
  end
  
end
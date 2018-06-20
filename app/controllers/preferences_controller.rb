class PreferencesController < ApplicationController
  def update
    currency = params[:currency] #if currencies.include?(params[:currency])
    if user_signed_in?
      current_user.settings(:preferences).currency = currency
      current_user.save
    else
      session[:currency] = currency
    end
    redirect_back fallback_location: root_path
  end
end

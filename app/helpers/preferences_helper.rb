module PreferencesHelper
  def prefered_currency
    return current_user.settings(:preferences).currency if user_signed_in?
    return currencies.include?(session[:currency]) ? session[:currency] : 'USD'
  end

  def with_prefered_currency(amount)
    amount.in(:usd).to(prefered_currency.downcase.to_sym).to_s(:symbol)
  end

  def currencies
    %w(USD AUD EUR GBP)
  end

  def select_currency_links
    links = ''
    currencies.each do |currency|
      links << tag.li do
        link_to currency, preferences_path(currency: currency), method: :put
      end
    end
    links.html_safe
  end
end

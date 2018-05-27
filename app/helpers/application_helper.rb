module ApplicationHelper
  def avatar_url(user)
    if user.image
      "https://graph.facebook.com/#{user.uid}/picture?type=large"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=150"
    end
  end

  def stripe_express_path
    "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_BNB4XU1h6OSfGzZNXQhIRtCZi7FTJee5&scope=read_write"
  end

  def prefered_currency
    return current_user.settings(:preferences).currency if user_signed_in?
    return session[:currency] ? currencies.keys.include?(session[:currency].to_sym) : 'USD'
  end

  def currencies
    {
      USD: {
        name: 'USD',
        symbol: '$',
      },
      AUD: {
        name: 'AUD',
        symbol: '$',
      },
      EUR: {
        name: 'EUR',
        symbol: '$',
      },
      GBP: {
        name: 'GBP',
        symbol: '$',
      }
    }
  end

  def currency_links(path)
    links = ''
    currencies.each do |currency, info|
      links << tag.li do
        link_to info[:name], path
      end
    end
    links.html_safe
  end

end

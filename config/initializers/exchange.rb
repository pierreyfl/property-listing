Exchange.configuration = Exchange::Configuration.new do |c|
  c.implicit_conversions = false
  c.cache = {
    subclass: :redis,
    host: Rails.application.secrets.redis_host,
    port: Rails.application.secrets.redis_port

    # hitting the internet only once/day to get new rates - by default expire: :daily
    # expire: :hourly
  }
  c.api = {
    subclass: :open_exchange_rates,
    app_id: Rails.application.secrets.open_exchange_rates_app_id,
    retries: 3,
    protocol: :http,
    fallback: :ecb
  }
end

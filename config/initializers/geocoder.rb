Geocoder.configure(
  units:    :km,
  lookup:   :google,
  cache:    Redis.new,
  always_raise: [
    Geocoder::RequestDenied,
    Geocoder::InvalidRequest,
    Geocoder::InvalidApiKey
  ]
)

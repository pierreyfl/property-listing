Rails.configuration.stripe = {
  :publishable_key => 'pk_test_kzdrGuXKHytzyzkQZeLQLkgV',
  :secret_key => 'sk_test_DweLb5uVwk3YqA8VC7x6Z77o'
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => Rails.application.secrects.sendgrid_api_key,
  :domain => Rails.application.secrects.domain,
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

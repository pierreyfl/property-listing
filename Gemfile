source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'faker'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'pg'

gem 'bootsnap', require: false
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap-datepicker-rails'
gem 'country_select'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'pry-byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sqlite3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise', '~> 4.2'
gem 'jquery-rails'
gem 'toastr-rails', '~> 1.0'
gem 'omniauth', '~> 1.6'
gem 'omniauth-facebook', '~> 4.0'
gem "paperclip", "~> 5.1.0"
gem 'aws-sdk', '~> 2.8'
gem 'geocoder', '~> 1.4'
gem 'ransack', '~> 1.8'
gem 'react-rails'
gem 'react-bootstrap-rails', '~> 0.13.0'
gem 'cancancan', '~> 2.0'

gem 'twilio-ruby'
gem 'fullcalendar-rails', '~> 3.4'
gem 'momentjs-rails', '~> 2.17.1'
gem 'stripe', '~> 3.0.0'
gem 'rails-assets-card', source: 'http://insecure.rails-assets.org' #'http://rails-assets.org'
gem 'omniauth-stripe-connect', '~> 2.10.0'
gem 'city-state'
gem 'rolify'
gem 'searchkick', '~> 3.1'
gem 'redis', '~> 4.0', '>= 4.0.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'social-share-button', '~> 1.1'
gem 'likeable', '~> 0.1.2'
gem 'ledermann-rails-settings', '~> 2.4', '>= 2.4.3'
gem 'exchange', '~> 1.2', '>= 1.2.2'
gem 'ahoy_matey', '~> 2.1'
gem 'groupdate', '~> 4.0', '>= 4.0.1'
gem 'chartkick', '~> 2.3', '>= 2.3.4'
gem 'searchjoy', '~> 0.3.2'
gem 'bitmask_attributes', '~> 1.0'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'paypal-sdk-rest'
gem 'mail_form', '~> 1.7', '>= 1.7.1'

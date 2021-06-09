source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg'
gem 'dotenv-rails'
gem 'devise'
gem 'bootstrap', '~> 5.0.1'
gem 'jquery-rails'
gem 'pry'
gem "omniauth", "~> 1.9.1"
gem 'omniauth-google-oauth2', ">= 0.8.0"
gem 'google-api-client', require: 'google/apis/calendar_v3'
gem 'omniauth-oauth2', '~> 1.6.0'
gem 'draper'
gem "pundit"
gem 'config'
gem 'liqpay', github: 'liqpay/sdk-ruby'

group :development, :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
  end

  gem 'faker'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'factory_bot_rails'
  gem 'database_cleaner-active_record'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

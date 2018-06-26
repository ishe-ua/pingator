# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

gem 'rails', '~> 5.2.0'
gem 'pg',    '>= 0.18', '< 2.0'
gem 'redis', '~> 4.0'
gem 'puma',  '~> 3.11'
gem 'sidekiq'
gem 'clockwork'
gem 'exception_notification'

gem 'coffee-rails', '~> 4.2'
gem 'sass-rails',   '~> 5.0'
gem 'turbolinks',   '~> 5'
gem 'uglifier',     '>= 1.3.0'

gem 'bcrypt',   '~> 3.1.7' # Use ActiveModel has_secure_password
gem 'jbuilder', '~> 2.5'   # Build JSON APIs with ease

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'guard-rails', require: false
  gem 'guard-migrate'
  gem 'guard-minitest'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
end

group :development do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'rdoc'
  gem 'rubocop', require: false

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'vcr'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails' # for bootstrap
gem 'octicons_helper'

gem 'kaminari'

gem 'devise'
gem 'dnsruby' # TODO
gem 'faraday'
gem 'rchardet'

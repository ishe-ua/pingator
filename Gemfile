# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg',    '>= 0.18', '< 2.0'
gem 'puma',  '~> 3.7'
gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'clockwork'

gem 'exception_notification'
gem 'mina', '~> 1.2.0'
gem 'god' # TODO: replace to eyes

gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'

gem 'jbuilder', '~> 2.5'   # Build JSON APIs with ease
gem 'bcrypt',   '~> 3.1.7' # Use ActiveModel has_secure_password

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'guard-rails', require: false
  gem 'guard-migrate'
  gem 'guard-minitest'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
end

group :development do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rdoc'
  gem 'bullet' # TODO

  gem 'web-console', '>= 3.3.0' # IRB console on exception pages or <%= console %>
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

source 'https://rails-assets.org' do
  # gem 'rails-assets-normalize-css', '~> 7.0.0'
  # gem 'rails-assets-zepto',         '~> 1.2.0'
end

# gem 'autoprefixer-rails'

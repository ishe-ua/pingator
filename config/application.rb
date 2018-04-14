require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pingator
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ###
    # app
    #

    # Save SSD
    if Rails.env.development? || Rails.env.test?
      config.logger = Logger.new('/dev/null')
    end

    # Skip generation (bin/rails g ...)
    config.generators do |g|
      g.assets false # stylesheets, js
      g.helper false # helpers
    end
  end
end

# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web' if defined?(Rails)
require_relative 'gem_redis.rb'

Sidekiq.configure_client do |config|
  config.redis = { url: redis.url }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis.url }
end

# See:
# 1. https://github.com/mperham/sidekiq/wiki/Monitoring
# 2. routes.rb
def protect_sidekiq_with_password # rubocop:disable AbcSize
  unless Rails.env.development? ||
         Rails.env.test?
    sidekiq_username = Rails.application.secrets.sidekiq[:username]
    sidekiq_password = Rails.application.secrets.sidekiq[:password]

    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(sidekiq_username)) &
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(sidekiq_password))
    end
  end
end

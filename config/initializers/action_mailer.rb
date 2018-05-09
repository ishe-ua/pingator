# frozen_string_literal: true

unless defined?(Rails)
  require 'action_mailer'
  require 'active_support'

  require_relative '../../lib/app.rb'
  require_relative '../../app/mailers/application_mailer.rb'

  Dir[File.expand_path('../../app/mailers/**/*.rb', __dir__)]
    .each { |f| require f }
end

##

am = ActionMailer::Base

am.default_options = { from: "#{APP::NAME} <#{APP::NOREPLY_EMAIL}>" }
am.default_url_options = { host: 'localhost', port: 3000 } if
  am.respond_to?(:default_url_options) &&
  defined?(Rails) && (Rails.env.development? || Rails.env.test?)

if defined?(Rails)
  unless Rails.env.development? ||
         Rails.env.test?

    am.default_url_options = { host: "http://#{APP::HOST}" }
    am.delivery_method = :smtp

    am.smtp_settings = {
      address:              APP.cred(:smtp, :server),
      port:                 APP.cred(:smtp, :port),
      user_name:            APP.cred(:smtp, :username),
      password:             APP.cred(:smtp, :password),
      domain:               APP::HOST,
      authentication:       :login,
      enable_starttls_auto: true
    }
  end
end

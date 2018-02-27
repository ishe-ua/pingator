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

if defined?(Rails) && (!Rails.env.development? && !Rails.env.test?)
  am.default_url_options = { host: "http://#{APP::HOST}" }
  am.delivery_method = :smtp

  am.smtp_settings = {
    address:              Rails.application.secrets.smtp[:server],
    port:                 Rails.application.secrets.smtp[:port],
    domain:               APP::HOST,
    user_name:            Rails.application.secrets.smtp[:username],
    password:             Rails.application.secrets.smtp[:password],
    authentication:       :login,
    enable_starttls_auto: true
  }
end

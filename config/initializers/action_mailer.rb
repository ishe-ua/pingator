# frozen_string_literal: true

am = ActionMailer::Base

am.default_options     = { from: "#{APP::NAME} <#{APP::NOREPLY_EMAIL}>" }
am.default_url_options = { host: "http://#{APP::HOST}" }

if prod?
  am.delivery_method = :smtp
  am.smtp_settings = {
    address:   APP.cred(:smtp, :server),
    port:      APP.cred(:smtp, :port),
    user_name: APP.cred(:smtp, :username),
    password:  APP.cred(:smtp, :password),
    domain:    APP::HOST,
    authentication: :login,
    enable_starttls_auto: true
  }
end

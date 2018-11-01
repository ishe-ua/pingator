# frozen_string_literal: true

am = ActionMailer::Base
am.default_url_options = { host: APP::HOST }
am.default_url_options[:port] = APP::PORT unless prod?

if prod?
  am.delivery_method = :smtp
  am.smtp_settings = {
    address: cred(:smtp, :server),
    port: cred(:smtp, :port),
    user_name: cred(:smtp, :username),
    password: cred(:smtp, :password),
    domain: APP::HOST,
    authentication: :login,
    enable_starttls_auto: true
  }
end

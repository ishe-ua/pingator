# frozen_string_literal: true

if prod?
  Recaptcha.configure do |config|
    config.site_key   = cred(:recaptcha, :site_key)
    config.secret_key = cred(:recaptcha, :secret_key)

    # Uncomment the following line if you are using a proxy server:
    # config.proxy = 'http://myproxy.com.au:8080'
  end
end

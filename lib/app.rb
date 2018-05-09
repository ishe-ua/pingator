# frozen_string_literal: true

# APP constants
module APP
  class << self
    def cred(group, name = nil)
      creds = Rails.application.credentials
      value = name ? creds.send(group)[name] : creds.send(group)
      value || raise("Undefined cred #{group} / #{name}")
    end

    def prod?
      !(Rails.env.development? || Rails.env.test?)
    end
  end

  NAME = 'pingator'
  HOST = 'pingator.io'

  # Start development since
  SINCE = 2018

  ADMIN_EMAIL   = prod? ? cred(:admin_email) : "admin@#{HOST}"
  NOREPLY_EMAIL = "no-reply@#{HOST}"
  SUPPORT_EMAIL = "support@#{HOST}"

  # For test and development environments
  DEFAULT_PASSWORD = '1234567'

  SIDEKIQ_USERNAME = 'admin'

  # See Color, Status
  UNDEFINED = :undefined
end

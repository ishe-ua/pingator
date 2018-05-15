# frozen_string_literal: true

# Data from _config/credentials.yml.enc_
def cred(group, name = nil)
  creds = Rails.application.credentials
  value = name ? creds.send(group)[name] : creds.send(group)
  value || raise("Undefined cred #{group} / #{name}")
end

# Any environment except development and test
def prod?
  !(Rails.env.development? || Rails.env.test?)
end

# APP constants
module APP
  NAME = 'pingator'
  HOST = 'pingator.io'

  # Start development since
  SINCE = 2018

  ADMIN_EMAIL = prod? ? cred(:admin_email) : "admin@#{HOST}"
  NOREPLY_EMAIL = "no-reply@#{HOST}"
  SUPPORT_EMAIL = "support@#{HOST}"

  # For development and test environments
  DEFAULT_PASSWORD = '1234567'

  # See Color, Status
  UNDEFINED = :undefined
end

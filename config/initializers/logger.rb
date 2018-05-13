# frozen_string_literal: true

# See https://github.com/plataformatec/devise#password-reset-tokens-and-rails-logs
Rails.application.config.log_level = :warn if prod?

# frozen_string_literal: true

Rails.application.config.i18n.load_path +=
  Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

Rails.application.config.action_view
     .raise_on_missing_translations = true

# frozen_string_literal: true

# gem 'devise' redefinition
class RegistrationsController < Devise::RegistrationsController
  protected

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(_resource)
    flash.notice = 'We have sent you an Email'
    info_url
  end
end

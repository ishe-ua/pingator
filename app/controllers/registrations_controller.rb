# frozen_string_literal: true

# gem 'devise' redefinition
class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_recaptcha, only: [:create]

  protected

  # The path used after sign up
  def after_inactive_sign_up_path_for(_resource)
    flash.notice = I18n.t('registrations.we_sent_you_email')
    info_url
  end

  private

  # gem 'recaptcha'
  #
  # See https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
  def check_recaptcha
    return if verify_recaptcha

    self.resource = resource_class.new sign_up_params
    resource.validate # Look for any other validation errors besides Recaptcha

    set_minimum_password_length
    respond_with resource
  end
end

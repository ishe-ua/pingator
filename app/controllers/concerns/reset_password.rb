# frozen_string_literal: true

# See AccountsController
module ResetPassword
  extend ActiveSupport::Concern

  included do
    skip_before_action :require_sign_in, only: :reset_password
  end

  # GET and POST
  def reset_password
    reset_password_get  if request.get?
    reset_password_post if request.post?
    nil
  end

  protected

  # Show form
  def reset_password_get
    render 'reset_password'
  end

  # Reset password and send AccountsMailer#new_password.
  def reset_password_post
    account = Account.find_by(email: params[:email])

    if account
      generate_new_and_send_email(account)
      flash.notice = t '.success'
    else
      flash.alert = t '.fail'
    end

    redirect_to info_path
  end

  private

  def generate_new_and_send_email(account)
    new_passwd = Account.generate_random_password
    account.update!(password: new_passwd, password_confirmation: new_passwd)

    AccountsMailer
      .new_password(account, new_passwd)
      .deliver_later(queue_priority: 0)
  end
end

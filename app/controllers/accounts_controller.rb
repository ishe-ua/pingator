# frozen_string_literal: true

# See Account
class AccountsController < ApplicationController
  before_action :set_account, only: %i[edit update]
  skip_before_action :require_sign_in, only: %i[new create]

  include ConfirmEmail
  include ResetPassword

  def new
    @account = Account.new
  end

  # See AccountsMailer#email_confirmation
  def create
    ap = account_params
    ap[:password_confirmation] = ap[:password]

    @account = Account.new(ap)
    if @account.save
      AccountsMailer.email_confirmation(@account).deliver_later
      AdminMailer.new_registration(@account).deliver_later

      redirect_to info_path, notice: t('.we_sent_you_email')
    else
      render :new
    end
  end

  def edit; end

  # See EmailConfirmation and AccountsMailer#email_confirmation
  def update
    if @account.update(account_params)
      if new_email?
        unconfirm_email_and_send_confirmation
        redirect_to info_path, notice: t('.confirm_new_email')
      else
        redirect_to settings_path
      end
    else
      render :edit
    end
  end

  private

  def set_account
    @account = current_account # !!
  end

  def account_params
    params
      .require(:account)
      .permit(:id, :email, :password, :password_confirmation)
  end

  def new_email?
    @account.previous_changes['email']&.any?
  end

  def unconfirm_email_and_send_confirmation
    @account.unconfirm_email
    AccountsMailer.email_confirmation(@account).deliver_later
  end
end

# frozen_string_literal: true

# Email us
class ContactsController < ApplicationController
  skip_before_action :authenticate_account!

  def new; end

  # See ContactsMailer
  def create # rubocop:disable AbcSize, MethodLength
    email = params[:email]
    theme = params[:theme]
    text = params[:text]

    if email.present? && theme.present? && text.present?
      ContactsMailer.thank_you(email).deliver_later
      ContactsMailer.to_us(email, theme, text).deliver_later

      redirect_to info_path, notice: t('.thank_you')
    else
      flash.now[:alert] = t('.fill_fields')
      render :new
    end
  end
end

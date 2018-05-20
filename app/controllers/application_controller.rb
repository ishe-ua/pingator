# frozen_string_literal: true

# Base controller
class ApplicationController < ActionController::Base
  include Auth
  include Resource

  before_action :validate_user

  protected

  def validate_user
    redirect_to edit_user_path(current_user), notice: 'Please fill your data' if
      signed_in? &&
      current_user &&
      current_user.invalid?
  end
end

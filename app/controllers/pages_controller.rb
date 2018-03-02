# frozen_string_literal: true

# Static pages
class PagesController < ApplicationController
  skip_before_action :require_sign_in, only: %i[home info]

  def home
    redirect_to dash_path if signed_in?
  end

  # Show flash messages
  def info
    redirect_to(root_path) if flash.notice.blank? && flash.alert.blank?
  end

  # Start page after sign in
  def dash; end
end

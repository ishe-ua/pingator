# frozen_string_literal: true

# Static pages
class PagesController < ApplicationController
  # TODO: skip_before_action :require_sign_in, only: %i[home info]

  def home; end

  # Show flash messages
  def info
    redirect_to(root_path) if flash.notice.blank? && flash.alert.blank?
  end
end

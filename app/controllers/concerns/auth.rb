# frozen_string_literal: true

# gem 'devise'
module Auth
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_account!
    helper_method :current_user
  end

  def current_user
    current_account.user
  end
end

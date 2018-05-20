# frozen_string_literal: true

# Fill User data checker
module ValidateUser
  extend ActiveSupport::Concern

  included do
    before_action :validate_user
  end

  protected

  def validate_user
    redirect_to edit_user_path(current_user), notice: 'Please fill your data' if
      signed_in? &&
      current_user &&
      current_user.invalid?
  end
end

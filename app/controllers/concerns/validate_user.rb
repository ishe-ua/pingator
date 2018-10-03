# frozen_string_literal: true

# Fill User data checker
module ValidateUser
  extend ActiveSupport::Concern

  EXCLUDED_CONTROLLERS = %w[users sessions].freeze

  included do
    before_action :validate_user
  end

  protected

  def validate_user
    if EXCLUDED_CONTROLLERS.exclude?(controller_name) &&
       signed_in? &&
       current_user &&
       current_user.invalid?
      flash[:alert] = 'Please fill your profile' # TODO: i18n
      redirect_to edit_user_path(current_user)
    end
  end
end

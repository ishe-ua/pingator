# frozen_string_literal: true

# Check (response) duration (in milliseconds).
#
# Field +duration+ in table:
# * integer
#
module Duration
  extend ActiveSupport::Concern

  included do
    validates :duration, presence: true,
                         numericality: { only_integer: true,
                                         greater_than_or_equal_to: 0 }
  end
end

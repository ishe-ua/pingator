# frozen_string_literal: true

# Request duration (in milliseconds).
#
# Field +duration+ in table:
# * integer
#
module Duration
  extend ActiveSupport::Concern

  included do
    after_initialize :set_default_duration

    validates :duration, presence: true,
                         numericality: { only_integer: true,
                                         greater_than_or_equal_to: 0 }
  end

  protected

  def set_default_duration
    self.duration ||= 0
  end
end

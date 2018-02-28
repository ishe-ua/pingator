# frozen_string_literal: true

# Field +checktime+ in table:
# * integer
#
module Check
  extend ActiveSupport::Concern

  # Check Url every minutes
  PLANS = { a: 30, b: 15, c: 5, d: 1 }.freeze

  included do
    enum checktime: PLANS

    after_initialize :set_default_checktime
    validates :checktime, presence: true
  end

  protected

  def set_default_checktime
    self.checktime ||= :a
  end
end

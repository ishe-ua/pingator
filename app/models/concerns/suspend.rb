# frozen_string_literal: true

# Suspend Check or not.
#
# Field +suspend+ in table:
# * boolean
#
module Suspend
  extend ActiveSupport::Concern

  included do
    validates :suspend, inclusion: { in: [true, false] }
    after_initialize :set_default_suspend
  end

  def suspended?
    suspend
  end

  def suspend!
    update(suspend: true)
  end

  def resume
    update(suspend: false)
  end

  protected

  def set_default_suspend
    self.suspend = false if suspend.nil?
  end
end

# frozen_string_literal: true

# Suspend Check or not.
#
# Field +suspend+ in table:
# * boolean
#
module Suspend
  extend ActiveSupport::Concern

  def suspended?
    suspend
  end

  def suspend!
    update(suspend: true)
  end

  def resume
    update(suspend: false)
  end
end

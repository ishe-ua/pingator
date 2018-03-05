# frozen_string_literal: true

# Request start time.
#
# Field +start+ in table:
# * datetime
#
module Start
  extend ActiveSupport::Concern

  included do
    validates :start, presence: true
  end
end

# frozen_string_literal: true

# Response (http) code.
#
# Field +code+ in table:
# * integer
#
module Code
  extend ActiveSupport::Concern

  included do
    validates :code, presence: true,
                     numericality: { only_integer: true,
                                     greater_than: 0 }
  end
end

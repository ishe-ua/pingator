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

  # Like '200 OK', '400 Bad Request'...
  def code_with_name
    msg = Rack::Utils::HTTP_STATUS_CODES[code]
    "#{code} #{msg}"
  end
end

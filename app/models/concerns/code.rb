# frozen_string_literal: true

# Response (http status) code.
#
# Field +code+ in table:
# * integer
#
module Code
  extend ActiveSupport::Concern

  BAD_CONNECTION = 700

  included do
    validates :code, presence: true,
                     numericality: { only_integer: true,
                                     greater_than: 0 }
  end

  # Like '200 OK', '400 Bad Request'...
  def code_with_name
    msg = Rack::Utils::HTTP_STATUS_CODES[code]
    msg = 'Bad connection' if code == BAD_CONNECTION

    raise 'Code not found' if msg.blank?
    "#{code} #{msg}"
  end
end

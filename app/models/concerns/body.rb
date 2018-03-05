# frozen_string_literal: true

# Response body.
#
# Field +body+ in table:
# * text
#
module Body
  extend ActiveSupport::Concern

  MAX_BODY = 4.kilobytes

  included do
    validates :body,
              length: { maximum: MAX_BODY }

    before_validation :trim_body
  end

  protected

  def trim_body
    self.body = body[0...(MAX_BODY - 3)] + '...' if body.present? &&
                                                    body.length > MAX_BODY
  end
end

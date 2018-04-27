# frozen_string_literal: true

# See Ping
module Color
  extend ActiveSupport::Concern

  def red?
    !green?
  end

  def green?
    (code >= 200) && (code < 300)
  end
end

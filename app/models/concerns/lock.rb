# frozen_string_literal: true

# When Url locked (nil - not locked).
#
# Field in table:
# +locked_at+
#
module Lock
  extend ActiveSupport::Concern

  def locked?
    locked_at ? true : false
  end

  def lock!
    update!(locked_at: Time.current)
  end

  def unlock
    update!(locked_at: nil)
  end
end

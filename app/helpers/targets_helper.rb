# frozen_string_literal: true

module TargetsHelper
  def current_status(target)
    target.success? ? 'OK' : 'FAIL'
  end

  def current_status_color(target)
    target.success? ? 'green' : 'red'
  end
end

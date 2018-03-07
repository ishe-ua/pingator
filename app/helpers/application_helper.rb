# frozen_string_literal: true

module ApplicationHelper
  def dashed(str)
    str.presence || '-'
  end

  alias d dashed
end

# frozen_string_literal: true

module ApplicationHelper
  def dashed(str = nil)
    str.presence || '-'
  end

  alias d dashed
  alias dash dashed

  def empty_grid_area(klass = nil)
    tag.div(class: klass)
  end
end

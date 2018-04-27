# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test('dashed') { assert_equal dashed('text'), 'text' }
  test('dashed with nil') { assert_equal dash, '-' }
end

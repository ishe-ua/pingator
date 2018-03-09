# frozen_string_literal: true

require 'test_helper'

class DurationTest < ActiveSupport::TestCase
  setup do
    @instance = build(:ping)
  end

  test 'required field' do
    instance.duration = nil
    assert_not instance.valid?
  end

  test 'only integer' do
    instance.duration = 1.1
    assert_not instance.valid?
  end

  test 'greater than or equal to 0' do
    instance.duration = -1
    assert_not instance.valid?
  end
end

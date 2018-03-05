# frozen_string_literal: true

require 'test_helper'

class CodeTest < ActiveSupport::TestCase
  setup do
    @instance = build(:check)
  end

  test 'required field' do
    instance.code = nil
    assert_not instance.valid?
  end

  test 'only integer' do
    instance.code = 1.1
    assert_not instance.valid?
  end

  test 'greater than 0' do
    instance.code = 0
    assert_not instance.valid?
  end
end

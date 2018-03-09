# frozen_string_literal: true

require 'test_helper'

class StartTest < ActiveSupport::TestCase
  setup do
    @instance = build(:ping)
  end

  test 'required field' do
    instance.duration = nil
    assert_not instance.valid?
  end
end

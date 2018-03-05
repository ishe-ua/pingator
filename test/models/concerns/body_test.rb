# frozen_string_literal: true

require 'test_helper'

class BodyTest < ActiveSupport::TestCase
  setup do
    @instance = build(:check)
  end

  test 'limited length' do
    instance.body = 'a' * (instance.class::MAX_BODY * 2)
    assert instance.valid?
    assert_equal instance.body.length, instance.class::MAX_BODY
  end
end

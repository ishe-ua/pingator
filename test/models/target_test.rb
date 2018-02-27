# frozen_string_literal: true

require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'unique url in scope' do
    instance.url = targets(:mary).url
    assert_not instance.valid?
  end

  test 'not unique url outside scope' do
    instance.url = targets(:john).url
    assert instance.valid?
  end
end

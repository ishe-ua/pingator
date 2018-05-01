# frozen_string_literal: true

require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest

  test 'pings_with' do
    skip
  end
end

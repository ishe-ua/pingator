# frozen_string_literal: true

require 'test_helper'

class PingTest < ActiveSupport::TestCase
  setup do
    @instance = build(:ping)
  end

  include ValidateInstanceTest
  include ValidateFixturesTest
end

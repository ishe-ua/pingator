# frozen_string_literal: true

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
  end

  test 'protect enum values' do
    assert_equal instance_class.statuses[:wait], 0
    assert_equal instance_class.statuses[:informational], 1
    assert_equal instance_class.statuses[:success], 2
    assert_equal instance_class.statuses[:redirection], 3
    assert_equal instance_class.statuses[:client_error], 4
    assert_equal instance_class.statuses[:server_error], 5
  end

  test 'required field' do
    instance.status = nil
    assert_not instance.valid?
  end

  test 'wait status by default' do
    assert instance.wait?
  end
end

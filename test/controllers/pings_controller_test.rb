# frozen_string_literal: true

require 'test_helper'

class PingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in
    @target = targets(:mary)
  end

  test 'should get index' do
    get target_pings_url(@target)
    assert_response :success
  end
end

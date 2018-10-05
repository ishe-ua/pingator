# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mary)
    sign_in(@user.account)
  end

  test 'should get edit' do
    get edit_user_path(id: @user.id)
    assert_response :success
  end

  test 'should update company' do
    patch user_path(id: @user.id), params: { user: { name: 'new name' } }
    assert_redirected_to profile_path
  end
end

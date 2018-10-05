# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup { sign_out :account }

  test 'home' do
    get home_url
    assert_response :success
  end

  test 'info' do
    get info_path
    assert_redirected_to controller: :pages, action: :home
  end

  test 'profile' do
    sign_in accounts(:mary)
    get profile_url
    assert_response :success
  end
end

# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:mary)
  end

  test 'should get new' do
    get new_session_path
    assert_response :success
  end

  test 'should post create - success' do
    post sessions_path(email: @account.email,
                       password: APP::DEFAULT_PASSWORD)

    assert_equal session[:account_id], @account.id
    assert_redirected_to controller: :pages, action: :home
  end

  test 'should post create - fail' do
    post sessions_path(email: 'left-email@example.com',
                       password: 'left password', lang: I18n.locale)
    assert_response :success

    assert_not session[:account_id]
    assert_equal flash[:alert], I18n.t('sessions.errors.fail')
  end

  test 'should get destroy' do
    sign_in(@account)
    delete session_path(id: @account.id)

    assert_not session[:account_id]
    assert_redirected_to controller: :pages, action: :home
  end
end

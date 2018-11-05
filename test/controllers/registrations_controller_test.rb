# frozen_string_literal: true

require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_out :account }

  test 'redirect to info page with message after sign up' do
    post '/accounts', params: { email: 'user@example.com',
                                password: APP::DEFAULT_PASSWORD,
                                password_confirmation: APP::DEFAULT_PASSWORD }

    assert_response :success
  end
end

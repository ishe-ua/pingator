# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome

  attr_reader :current_account

  def sign_in(account = accounts(:mary))
    @current_account = account
    visit login_path

    find(:id, 'email').set(account.email)
    find(:id, 'password').set(APP::DEFAULT_PASSWORD)

    click_button('OK')
    assert_equal current_path, dash_path
  end

  def sign_out
    visit logout_path
    assert_equal current_path, root_path
  end
end

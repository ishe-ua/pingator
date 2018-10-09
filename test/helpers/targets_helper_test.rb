# frozen_string_literal: true

require 'test_helper'

class TargetsHelperTest < ActionView::TestCase
  test '#current_status - locales presence' do
    assert_key_presence 'locked'

    assert_key_presence 'verification.wait'
    assert_key_presence 'verification.verified'
    assert_key_presence 'verification.not_verified'

    assert_key_presence 'status.success'
    assert_key_presence 'status.fail'
  end

  test '#current_status_class - locales presence' do
    assert_key_presence 'status.success'
    assert_key_presence 'verification.verified'
  end

  private

  def assert_key_presence(key)
    assert I18n.exists?("targets_helper.current_status.#{key}")
  end
end

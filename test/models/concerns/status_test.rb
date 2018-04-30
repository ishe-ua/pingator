# frozen_string_literal: true

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  setup do
    @instance = build(:target)
    Ping.destroy_all
  end

  test 'status_by' do
    skip
  end

  test 'status' do
    build(:ping, code: 200).save!
    assert instance.status
  end

  test 'success?' do
    build(:ping, code: 200).save!
    assert target.last_ping.green?
    assert target.success?
  end

  test 'warn?' do
    build(:ping, code: 300).save!
    assert target.last_ping.yellow?
    assert target.warn?
  end

  test 'fail?' do
    build(:ping, code: 400).save!
    assert target.last_ping.red?
    assert target.fail?
  end

  test 'find_by' do
    skip
  end
end

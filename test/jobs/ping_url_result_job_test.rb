# frozen_string_literal: true

require 'test_helper'

class PingUrlResultJobTest < ActiveJob::TestCase
  setup do
    @job = PingUrlResultJob
    Ping.delete_all
  end

  test 'first (success or fail) ping' do
    assert_difference 'Ping.count' do
      assert_enqueued_emails(1) do
        job.perform_now(mary.id, build_resp(code: [200, 404].sample))
      end
    end
  end

  test 'from success to fail' do
    Ping.create!(build_resp_hash(code: 200, target: mary))
    assert Ping.last.green?

    assert_difference 'Ping.count' do
      assert_enqueued_emails(1) do
        job.perform_now(mary.id, build_resp(code: 500))
        assert Ping.last.red?
      end
    end
  end

  test 'from fail to success' do
    Ping.create!(build_resp_hash(code: 404, target: mary))
    assert Ping.last.red?

    assert_difference 'Ping.count' do
      assert_enqueued_emails(1) do
        job.perform_now(mary.id, build_resp(code: 200))
        assert Ping.last.green?
      end
    end
  end

  test 'from success to success' do
    Ping.create!(build_resp_hash(code: 200, target: mary))
    assert Ping.last.green?

    assert_difference 'Ping.count' do
      assert_no_enqueued_emails do
        job.perform_now(mary.id, build_resp(code: 200))
        assert Ping.last.green?
      end
    end
  end

  test 'from fail to fail' do
    Ping.create!(build_resp_hash(code: 500, target: mary))
    assert Ping.last.red?

    assert_difference 'Ping.count' do
      assert_no_enqueued_emails do
        job.perform_now(mary.id, build_resp(code: 500))
        assert Ping.last.red?
      end
    end
  end

  test '#bad?' do
    assert job.new.send(:bad?, PingJob::RESULT_KEYS.shuffle)
    assert_not job.new.send(:bad?, ['aa'])
  end

  private

  def mary
    targets(:mary)
  end

  def build_resp_hash(opts = {})
    { start: Time.current, duration: 70, code: 200, body: 'test' }
      .merge(opts)
  end

  def build_resp(opts = {})
    build_resp_hash(opts)
      .merge(opts)
      .to_json
      .to_s
  end
end

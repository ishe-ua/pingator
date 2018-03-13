# frozen_string_literal: true

module TargetsHelper
  def current_status(target) # rubocop:disable all
    if target.locked?
      Lock::LOCKED
    elsif target.not_verified?
      Verification::NOT_VERIFIED
    elsif target.verified? && target.pings.empty?
      Verification::VERIFIED
    elsif target.success?
      Status::SUCCESS
    elsif target.fail?
      Status::FAIL
    else
      raise 'Current status not found'
    end
  end

  # hack
  def current_status_class(target)
    current_status(target) == 'SUCCESS' ? 'green' : 'red'
  end

  def last_ping_time(target)
    ping = target.pings.last
    ping && ping.start.present? ? time_ago_in_words(ping.start) + ' ago' : '-'
  end

  def plans_for_select
    Target.plans.map do |k, v|
      time = "#{v}min"

      price = begin
                dollars = Plan::PRICES[k.to_sym]
                dollars.positive? ? "#{dollars}$ month" : 'free'
              end

      ["#{time} - #{price}", k]
    end
  end
end

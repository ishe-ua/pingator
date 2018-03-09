# frozen_string_literal: true

module TargetsHelper
  def current_status(target)
    target.success? ? 'OK' : 'FAIL'
  end

  def current_status_color(target)
    target.success? ? 'green' : 'red'
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

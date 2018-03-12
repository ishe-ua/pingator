# frozen_string_literal: true

# Dynamic calcs.
module Status
  extend ActiveSupport::Concern

  # From Redis or Ping
  def last_ping
    @last_ping ||= begin
                     json = nil # TODO: get from Redis
                     json.present? ? Ping.new(json.to_hash) : pings.last
                   end
  end

  # See http status codes
  def success?
    last_ping&.code &&
      last_ping.code.is_a?(Integer) &&
      last_ping.code >= 200 &&
      last_ping.code < 300
  end

  def fail?
    !success?
  end
end

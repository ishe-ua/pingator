# frozen_string_literal: true

Redis.current = Redis.new(
  Rails
    .application
    .config_for(:redis)
)

def redis
  Redis.current
end

def redis.url
  ENV.fetch('REDIS_URL', redis.connection[:id])
end

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
  redis.connection[:id]
end

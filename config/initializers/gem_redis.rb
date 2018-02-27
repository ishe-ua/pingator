# frozen_string_literal: true

require 'redis'
require 'yaml'

def redis_opts
  env = defined?(Rails) ? Rails.env : ENV.fetch('RAILS_ENV') { 'development' }
  src = ERB.new(File.read('config/redis.yml')).result

  YAML.load(src)[env] # rubocop:disable YAMLLoad
end

Redis.current = Redis.new(redis_opts)

def redis
  Redis.current
end

def redis.url
  redis_opts['url'] ||
    "redis://#{redis.client.host}:#{redis.client.port}/#{redis.client.db}"
end

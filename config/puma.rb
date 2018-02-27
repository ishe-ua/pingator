# frozen_string_literal: true

require_relative '../lib/app.rb'

threads_count = ENV.fetch('RAILS_MAX_THREADS') { 1 }
threads threads_count, threads_count

env = ENV.fetch('RAILS_ENV') { 'development' }
environment env

if defined?(Rails) && Rails.env.development?
  port ENV.fetch('PORT') { 3000 }
else
  bind "unix:/tmp/#{APP::NAME.tr('-', '_')}_#{env}.sock"
end

if defined?(Rails) && (!Rails.env.development? && !Rails.env.test?)
  workers ENV.fetch('WEB_CONCURRENCY') { 2 }
  preload_app!

  before_fork do
    ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
  end

  on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
  end
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

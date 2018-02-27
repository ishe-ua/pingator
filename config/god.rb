# frozen_string_literal: true

def build_watcher(name, cmd, opts = {}) # rubocop:disable MethodLength
  God.watch do |w|
    raise 'Opts error' unless opts[:group] || opts[:dir]

    w.group = opts[:group] if opts[:group]
    w.name  = "#{opts[:group]}-#{name}"
    w.start = cmd

    w.keepalive
    w.env = opts[:env]

    w.dir     = "/home/deploy/#{opts[:dir]}/current"
    w.log     = "/home/deploy/#{opts[:dir]}/current/log/stdout-#{name}.log"
    w.err_log = "/home/deploy/#{opts[:dir]}/current/log/stderr-#{name}.log"
  end
end

###
#
#

require_relative '../lib/app'

opts = { group: APP::NAME,
         dir:   APP::HOST,
         env: { 'RAILS_ENV' => 'production' } }

build_watcher('web',    'bundle exec puma', opts)
build_watcher('worker', 'bundle exec sidekiq', opts)
build_watcher('clock',  'bundle exec clockwork lib/clock.rb', opts)

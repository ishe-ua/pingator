# frozen_string_literal: true

require 'mina/rails'
require 'mina/rbenv'
require 'mina/git'

require_relative '../lib/app.rb'

set :rails_env, 'production'
set :application_name, APP::NAME
set :domain,           APP::HOST
set :deploy_to,  "/var/www/#{fetch(:domain)}"
set :repository, "git@bitbucket.org:ishe-ua/#{fetch(:application_name)}.git"
set :branch, 'master'
set :user,   'deploy' # Username in the server to SSH to

set :shared_dirs, fetch(:shared_dirs, []).push(
      'public/system',
      'tmp',
      'log'
    )

set :shared_files, fetch(:shared_files, []).push(
      'db/pingator_development.sqlite3'
    )

# This task is the environment that is loaded for all remote run
# commands, such as `mina deploy` or `mina rake`.
task :remote_environment do
  invoke :'rbenv:load'
end

# Put any custom commands you need to run at setup.
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.5.0}
end

desc 'Deploys the current version to the server.'
task :deploy do
  # uncomment this line to make sure you pushed your local branch to
  # the remote origin
  invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      #   in_path(fetch(:current_path)) do
      #     # command %(mkdir -p tmp/)
      #     # command %(sudo god restart web)
      #     # command %(touch tmp/restart.txt)
      #   end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

## app
desc 'Restart God.'
task :restart do
  command %(god restart #{APP::NAME})
end

# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.14.0'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'
set :user, 'deploy'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/home/deploy/#{fetch(:application)}"

set :migration_role, :app
set :templated_config_files, []

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log",
#     color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml'
append :linked_files, 'config/credentials/production.key'
append :linked_files, 'config/sidekiq.yml'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets",
# "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
       'public/system'

# set :bundle_dir, '/home/deploy/gems'
# set :default_env, {
#   'GEM_HOME' => '/home/deploy/gems',
#   'GEM_PATH' => '/home/deploy/gems'
# }

set :passenger_environment_variables,
    { path: '/usr/sbin/passenger-status:$PATH' }
# set :passenger_restart_with_touch, true

# SIDEKIQ CONFIG
set :sidekiq_role, :app
set :sidekiq_config, File.join(current_path, 'config', 'sidekiq.yml').to_s

namespace :sidekiq do
  desc 'Stop sidekiq (graceful shutdown, put unfinished tasks back to Redis)'
  task :stop do
    on roles :all do |_role|
      execute :systemctl, '--user', 'stop', :sidekiq
    end
  end

  desc 'Start sidekiq'
  task :start do
    on roles :all do |_role|
      execute :systemctl, '--user', 'start', :sidekiq
    end
  end

  desc 'Restart sidekiq'
  task :restart do
    on roles(:all), in: :sequence, wait: 5 do
      execute :systemctl, '--user', 'restart', :sidekiq
    end
  end
end

namespace :deploy do
  after :finishing, 'deploy:restart', 'deploy:cleanup'
  after :restart, 'sidekiq:restart'
end

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before
# first deploy.
# set :ssh_options, verify_host_key: :secure

# config valid only for current version of Capistrano
lock '3.4.0'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

set :bundle_jobs, 2

set :conditionally_migrate, true # run migrate only if files changes in db/migrate

set :application, 'ohoto'
set :repo_url, 'git@github.com:eeremeev/ohoto.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/ohoto'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/application.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :ssh_options, { forward_agent: true, auth_methods: %w(publickey) }

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :unicorn_config_path, "#{fetch(:deploy_to)}/current/config/unicorn.rb"
# set :unicorn_restart_sleep_time, 10
set :unicorn_pid, "#{fetch(:deploy_to)}/current/tmp/pids/unicorn.pid"


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end

namespace :deploy do

  after :publishing, :clear do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      #invoke 'unicorn:restart'
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

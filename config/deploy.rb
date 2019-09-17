
# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "phonebook"
set :repo_url, "git@github.com:harikesh-kolekar/phonebook.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.1.5'      # Defaults to: 'default'
# set :rvm_custom_path, '~/.rvm'  # only needed if not detected

set :linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system']

# namespace :deploy do

#   desc "Show pending changes"
#   task :pending do
#   	execute 'bundle install' 
#   end
# end

# after 'deploy:publishing', 'deploy:restart'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
namespace :deploy do
  desc 'create_db'
  task :create_db do
    on roles(:app) do
      invoke 'rvm1:hook'
      within release_path do
        execute :bundle, :exec, :"rake db:create RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  desc 'Uploads required config files'
  task :upload_configs do
    on roles(:all) do
      upload!(".env.#{fetch(:stage)}", "#{deploy_to}/shared/.env")
    end
  end

  desc 'Seeds database'
  task :seed do
    on roles(:app) do
      invoke 'rvm1:hook'
      within release_path do
        execute :bundle, :exec, :"rake db:seed RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  before 'deploy:migrate', 'deploy:create_db'
  # after :finished, 'deploy:seed'
  after :finished, 'app:restart'
end

namespace :app do
  desc 'Start application'
  task :start do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :'pumactl -F config/puma.rb stop'

      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        # if test("[ -f #{deploy_to}/current/tmp/pids/puma.pid ]")
        #   execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
        # end

        # execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
        # execute 'fuser -k 3000/tcp' rescue "not killed"
        # execute :bundle, :exec, :"rails s -d -e #{fetch(:stage)}" rescue "server not started"
        invoke 'unicorn:legacy_restart'
      end
    end
  end
end

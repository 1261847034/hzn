# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "hzn"
set :repo_url, "git@github.com:1261847034/hzn.git"

# deploy.rb or stage file (staging.rb, production.rb or else)
set :rvm_type, :auto                     # Defaults to: :auto
# set :rvm_ruby_version, '2.1.1-p76'      # Defaults to: 'default'
set :rvm_ruby_version, '2.1.6'
# set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
set :linked_files, %W{
                       config/database.yml config/secrets.yml config/unicorn/production.rb
                       config/nginx. config/redis.yml
                     }

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs, %w{
                      config/unicorn log tmp/pids tmp/cache tmp/sockets
                    }

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :unicorn_rack_env, -> { fetch(:rails_env) || "deployment" }

set :unicorn_restart_sleep_time, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      # invoke! 'unicorn:restart'
      # invoke! 'unicorn:duplicate'
      invoke! 'unicorn:legacy_restart'
    end
  end

  desc 'Force Restart application, eg: ruby version changed need force restart app'
  task :force_restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      # invoke! 'unicorn:restart'
      # invoke! 'unicorn:duplicate'
      invoke! 'unicorn:stop'
      sleep 2
      invoke! 'unicorn:start'
    end
  end

  desc 'build api doc files on api doc server'
  task :build_api_doc do
    on roles(:api_doc) do
      within(release_path) { rake 'api:build_doc' }
    end
  end

  after :publishing, :build_api_doc
  after :publishing, :restart

  desc 'update git remote repo url'
  task :update_git_repo do
    on release_roles :all do
      with fetch(:git_environmental_variables) do
        within repo_path do
          current_repo_url = execute :git, :config, :'--get', :'remote.origin.url'
          unless repo_url == current_repo_url
            execute :git, :remote, :'set-url', 'origin', repo_url
            execute :git, :remote, :update

            execute :git, :config, :'--get', :'remote.origin.url'
          end
        end
      end
    end
  end
end
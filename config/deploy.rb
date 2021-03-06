# frozen_string_literal: true
# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

# Restart options
set :passenger_restart_wait, 60

set :application, "ohsu2018"
set :repo_url, "https://github.com/repocamp/ohsu2018.git"

set :deploy_to, '/opt/ohsu2018'

set :log_level, :debug
set :bundle_flags, '--deployment'
set :bundle_env_variables, nokogiri_use_system_libraries: 1

set :keep_releases, 5
set :assets_prefix, "#{shared_path}/public/assets"

SSHKit.config.command_map[:rake] = 'bundle exec rake'

set :branch, ENV['REVISION'] || ENV['BRANCH_NAME'] || ENV['BRANCH'] || 'master'

append :linked_dirs, "log"
append :linked_dirs, "public/assets"

append :linked_files, "config/secrets.yml"
append :linked_files, ".env.production"

# Passenger is not consistently restarting, but the problem seems to
# be fixed by making it restart twice.
task :reenable_deploy_restart do
  ::Rake.application['passenger:restart'].reenable
  ::Rake.application['passenger:restart']
end
after 'deploy:restart', 'reenable_deploy_restart'

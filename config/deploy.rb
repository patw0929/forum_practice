require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano
require 'capistrano-unicorn'

set :stages, %w(staging production)
set :default_stage, "production"
# set :normalize_asset_timestamps, false

after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)

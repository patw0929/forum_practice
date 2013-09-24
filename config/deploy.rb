require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano
require 'capistrano-unicorn'

set :stages, %w(staging production)
set :default_stage, "production"
# set :normalize_asset_timestamps, false

after 'deploy:restart', 'unicorn:duplicate'

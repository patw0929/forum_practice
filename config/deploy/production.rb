set :application, "forum_practice"
set :domain, "ec2-175-41-209-113.ap-northeast-1.compute.amazonaws.com"
set :repository,  "git@github.com:patw0929/forum_practice.git"
set :deploy_to, "/home/apps/forum_practice"
 
role :app, domain
role :web, domain
role :db, domain, :primary => true
 
set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :user, "apps"
set :group, "apps"

default_environment["PATH"] = "/usr/local/rbenv/shims:/opt/ree/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
 
desc "Create database.yml and asset packages for production"
after("deploy:finalize_update") do
  db_config = "#{shared_path}/config/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

listen 2007 # by default Unicorn listens on port 8080
worker_processes 1 # this should be >= nr_cpus
pid "/home/apps/forum_practice/shared/pids/unicorn.pid"
stderr_path "/home/apps/forum_practice/shared/log/unicorn.log"
stdout_path "/home/apps/forum_practice/shared/log/unicorn.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiceRecord::Base) and
    ActiveRecord::Base.establish_connection
end

rails_root = `pwd`.chomp
bind      "unix:#{rails_root}/tmp/sockets/puma.sock"
pidfile     "#{rails_root}/tmp/pids/puma.pid"
activate_control_app

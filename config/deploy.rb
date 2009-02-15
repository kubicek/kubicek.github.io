set :application, "wwwkubicekcz"
set :repository, "git://github.com/kubicek/www_kubicek_cz.git"
set :scm, "git"

role :web, "server6.railshosting.cz"
role :app, "server6.railshosting.cz"
role :db,  "server6.railshosting.cz", :primary => true

set :deploy_to, "/home/wwwkubicekcz/app/"
set :user, "wwwkubicekcz"

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
require "bundler/capistrano" 

set :application, "WeCollaborate"
set :repository,  "https://github.com/JeroenKnoops/wecollaborate"

set :location, "54.229.65.0"

set :use_sudo, false
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

set :user, "admin"

set :deploy_to, "/export/tonyblack/wecollaborate"
set :deploy_via, :copy

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :remote do
  desc <<-DESC
  Add configuration files for WeCollaborate
  DESC
  task :create_symblink, :roles => :app do
    print "    creating symlink to database.yml.\n"
    run "rm /export/conf/wecollaborate/config/database.yml && ln -s /export/conf/wecollaborate/database.ymp /export/conf/wecollaborate/config/database.yml"
  end
end

before 'deploy:migrate', 'remote:create_symblink'
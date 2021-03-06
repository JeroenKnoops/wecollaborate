require "bundler/capistrano" 
# require 'new_relic/recipes'

set :application, "WeCollaborate"
set :repository,  "https://github.com/JeroenKnoops/wecollaborate"

set :location, "54.229.65.0"

set :use_sudo, false
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :default_environment, {
  'PATH' => "/home/admin/.rvm/gems/ruby-1.9.3-p194/bin:/home/admin/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/admin/.rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby 2.0.0',
  'GEM_HOME'     => '/home/admin/.rvm/gems/ruby-1.9.3-p194@wecollaborate',
  'GEM_PATH'     => '/home/admin/.rvm/gems/ruby-1.9.3-p194@wecollaborate',
  'BUNDLE_PATH'  => '/home/admin/.rvm/gems/ruby-1.9.3-p194@wecollaborate',   # If you are using bundler.
  'TERM'         => 'screen-256color',
  "RAILS_ENV"    => "production"
}

set :ssh_options, { :forward_agent => true }

default_environment["RAILS_ENV"] = 'production'
default_run_options[:shell] = 'bash'

role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

set :user, "admin"

set :deploy_to, "/export/tonyblack/wecollaborate"
set :deploy_via, :remote_cache

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

  task :install_bundler, :roles => :app do
      run "type -P bundle &>/dev/null || { gem install bundler --no-rdoc --no-ri; }"
  end
end

namespace :remote do
  desc <<-DESC
  Add configuration files for WeCollaborate
  DESC
  task :create_symblink, :roles => :app do
    print "    creating symlinks to database.yml.\n"
    run "rm #{release_path}/config/database.yml && ln -s /export/conf/wecollaborate/database.yml #{release_path}/config/database.yml"
    run "ln -s /export/conf/wecollaborate/newrelic.yml #{release_path}/config/newrelic.yml"
    run "rm #{release_path}/config/initializers/secret_token.rb && ln -s /export/conf/wecollaborate/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "rm #{release_path}/config/environments/production.rb && ln -s /export/conf/wecollaborate/production.rb #{release_path}/config/environments/production.rb"
  end
end

namespace :deploy do
  namespace :assets do

    task :precompile, :roles => :web do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
        run_locally("rake assets:clean && rake assets:precompile")
        run_locally "cd public && tar -jcf assets.tar.bz2 assets"
        top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
        run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
        run_locally "rm public/assets.tar.bz2"
        run_locally("rake assets:clean")
      else
        logger.info "Skipping asset precompilation because there were no asset changes"
      end
    end

    task :symlink, roles: :web do
      run ("rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets")
    end
  end
end

before 'deploy:assets:precompile',  'remote:create_symblink'
after 'remote:create_symblink', 'deploy:migrate'

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

after "deploy", "rvm:trust_rvmrc"

before "deploy:cold", 
    "deploy:install_bundler"

# after "deploy:update", "newrelic:notice_deployment"


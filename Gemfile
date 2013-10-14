source 'https://rubygems.org'

# gem 'rails', '3.2.13'
# 
gem 'rails', '~> 4.0.0'
# gem 'rails4_upgrade'

gem 'bootstrap-sass'
gem 'active_link_to'
gem 'haml-rails'

gem 'devise'

# gem 'devise',              github: 'plataformatec/devise'
# gem 'responders',          github: 'plataformatec/responders'
# gem 'inherited_resources', github: 'josevalim/inherited_resources'
# gem 'ransack',             github: 'ernie/ransack', branch: 'rails-4'
gem 'activeadmin',         github: 'gregbell/active_admin'
# gem 'formtastic',          github: 'justinfrench/formtastic'
gem 'protected_attributes'

gem 'tinymce-rails'

# http://www.orhancanceylan.com/rails-twitter-and-facebook-authentications-with-omniauth-and-devise/
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'twitter'
gem 'fb_graph'

# Gem for adding share buttons to pages.
gem 'shareable'

# New Relic
gem 'newrelic_rpm'

# gem "cancan", ">= 1.6.8"
# gem "rolify", ">= 3.2.0"
gem "simple_form" # , :git => 'git://github.com/plataformatec/simple_form.git'
# gem "figaro", ">= 0.5.3"
 
gem 'nifty-generators'

group :development do
  gem 'rspec-rails'
  gem "guard-rspec"
  gem "quiet_assets"
  gem "better_errors"
  gem "binding_of_caller"
  gem "capistrano"
  gem 'rvm-capistrano'
  gem 'metric_fu'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer', :platforms => :ruby
  
  # gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
  gem 'rb-fsevent', '0.9.3', :require => false
  gem 'growl'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem "mocha", :require => false
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard-spork'
  gem 'spork'
end

group :production do
  gem 'pg'
end



Wecollaborate::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false
  
  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  # devise
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  
  ENV['SECRET_TOKEN']= '74217d8bc9059e0a9b47c447a71cab6982d6fc9928a9a832ab6ea782343cb3a54f73c18d3a6ab3d5de4ea910d17930b41b42e311c3ae52c006298bb48cd7600b'
  
  ENV['TWITTER_CONSUMER_KEY'] = 'jkCq9QCKxDVKZEwWTgF7JA'
  ENV['TWITTER_CONSUMER_SECRET'] = 'sWzXZjDo7BNnqwQPhhcwfufBa4Ck9gOvieA2lipT8'
  
  ENV["FACEBOOK_APP_ID"] = '21031244697'
  ENV['FACEBOOK_APP_SECRET'] = 'fbfa11f797a87755e1ed420971988cca'
  
end

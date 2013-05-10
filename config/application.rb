require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)


module Looking
  class Application < Rails::Application
    if Rails.env == "production"
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => "UA-24402641-3")
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery rails)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
 

    config.action_mailer.default_url_options = { :host => 'furious-ice-2159.heroku.com' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default :charset => "utf-8"

    ActionMailer::Base.smtp_settings = {
      :port           => ENV['MAILGUN_SMTP_PORT'], 
      :address        => ENV['MAILGUN_SMTP_SERVER'],
      :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
      :password       => ENV['MAILGUN_SMTP_PASSWORD'],
      :domain         => 'lookinforit.com',
      :authentication => :plain,




#      :address => "55b4613f670756c24ca4@cloudmailin.net",
#      :authentication => :plain,
#      :domain => 'lookinforit.com',
#      :user_name => 'app1908147@heroku.com',
#      :password => '7b10d77f544c',
#      :enable_starttls_auto => true,
#      :port => 25
    } 

#   config.action_mailer.default_url_options = { :host => 'localhost:3000' }
#   config.action_mailer.delivery_method = :smtp
   
#   config.action_mailer.smtp_settings = {
#   :address => "smtp.gmail.com",
#   :port => 587,
#   :domain => 'lookinforit.com',
#   :user_name => 'danieljohnmarcus@gmail.com',
#   :password => '##########',
#   :authentication => 'plain',
#   :enable_starttls_auto => true } 
   
   #config.action_mailer.smtp_settings = {
   #  :address => "http://webhooks.cloudmailin.com/cm55b4613f670756c24ca4",
   #  :domain => 'http://cloudmailin.com/target/200',
   #  :user_name => 'app1908147@heroku.com',
   #  :password => '7b10d77f544c',
   #  :authentication => 'plain',
   #  :enable_starttls_auto => true } 
   config.action_mailer.raise_delivery_errors = true
     
  end

end

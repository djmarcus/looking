# Load the rails application
require File.expand_path('../application', __FILE__)
require File.join(File.dirname(__FILE__), 'boot')

# Load heroku vars from local file
heroku_env = File.join(RAILS_ROOT, 'config', 'heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)


# Initialize the rails application
Looking::Application.initialize!

#config.gem 'sunspot' , :lib => 'sunspot'
#config.gem 'sunspot_rails', :lib => 'sunspot/rails'

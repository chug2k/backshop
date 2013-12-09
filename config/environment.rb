# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Backshop::Application.initialize!


# TODO(Charles): Use environment vars here.

ActionMailer::Base.smtp_settings = {
    :user_name => 'app17887467@heroku.com',
    :password => '1qaalfof',
    :domain => 'stinkystudios.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
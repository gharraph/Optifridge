# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Optifridge::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => "pcushing",
  :password => "bootcamp12",
  :domain => "optifridge.herokuapp.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
}
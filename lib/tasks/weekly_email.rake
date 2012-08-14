desc "This task is called by the Heroku scheduler add-on"

task :weekly_email => :environment do
    #if Time.now.Saturday?
    User.send_weekly_email
end
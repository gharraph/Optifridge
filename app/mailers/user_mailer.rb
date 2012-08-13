class UserMailer < ActionMailer::Base
  include SendGrid
  default from: "optifridge@example.com"

  def weekly_email(user)
    @user = user
    @items = user.items.limit(5)
    mail(:to => user.email, :subject => "You have #{@user.items.count} items expiring soon.")
  end
end





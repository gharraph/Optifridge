class UserMailer < ActionMailer::Base
  default from: "optifridge@example.com"

  def weekly_email(user)
    @user = user
    mail(:to => user.email, :subject => "You have #{@user.items.count} items expiring soon.")
  end
end





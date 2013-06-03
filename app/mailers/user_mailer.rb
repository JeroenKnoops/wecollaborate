class UserMailer < ActionMailer::Base
  default from: "jeroen.knoops@gmail.com"
  
  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(:to => email_with_name, :subject => "Thank you for joining WeCollaborate.")
  end
  
end

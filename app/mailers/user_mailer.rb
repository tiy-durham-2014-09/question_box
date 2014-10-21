class UserMailer < ActionMailer::Base
  default from: "welcome@questionbox.com"
  
  def registration_confirmation(user)
    @user = user
    @url = user.set_token
    mail(:to => @user.email, :subject => "Thanks for registering!")
  end
end

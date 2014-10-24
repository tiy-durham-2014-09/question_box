class UserMailer < ActionMailer::Base
  default from: "welcome@questionbox.com"
  
  def registration_confirmation(user)
    @user = user
    @token = securerandom.urlsafe_base64
    mail(:to => @user.email, :subject => "Thanks for registering!")
  end
end

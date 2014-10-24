class VerificationMailer < ActionMailer::Base
  default from: "noreply@Question.box"


  def email_verification(user)
    @user = user
    mail to: @user.email, subject: "Welcome to Question Box! Please verify your account"
  end
end

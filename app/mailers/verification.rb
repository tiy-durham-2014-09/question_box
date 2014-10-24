class Verification < ActionMailer::Base
  default from: "from@example.com"
  def user_verification(user, token)
    @user = user
    @token = token
    mail to: @user.email, subject: "Verify your account"
  end

end

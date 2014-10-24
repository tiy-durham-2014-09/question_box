class ActivationMailer < ActionMailer::Base
  default from: "noreply@questionbox.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.security_mailer.password_reset.subject
  #
  def validation(user, key)
    @user = User.find_by(:user_id)
    @key = key

    mail to: @user.email, subject: "Email Validation for Question Box"
  end
end

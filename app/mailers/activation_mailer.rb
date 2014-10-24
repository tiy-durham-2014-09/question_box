class ActivationMailer < ActionMailer::Base
  default from: "noreply@questionbox.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.security_mailer.password_reset.subject
  #
  def account_activation(user, key)
    @user = user #User.create(name: "Noah", email: "noah@noah.com", score: 1)
    @key = key

    mail to: @user.email, subject: "Email Validation for Question Box"
  end
end

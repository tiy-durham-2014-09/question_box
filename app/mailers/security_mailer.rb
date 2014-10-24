class SecurityMailer < ActionMailer::Base
  default from: "no-reply@questionbox.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.security_mailer.password_reset.subject
  #
  def user_verification(id)
		@user = User.find(id)
	  mail to: @user.email, subject: "User verification for Question Box"
  end

end

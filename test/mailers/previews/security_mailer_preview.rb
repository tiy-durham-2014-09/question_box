# Preview all emails at http://localhost:3000/rails/mailers/security_mailer
class SecurityMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/security_mailer/password_reset
  def user_verification
    SecurityMailer.user_verification(id)
  end

end

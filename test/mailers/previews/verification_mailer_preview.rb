# Preview all emails at http://localhost:3000/rails/mailers/verification_mailer
class VerificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/verification_mailer/email_verification
  def email_verification
    VerificationMailer.email_verification
  end

end

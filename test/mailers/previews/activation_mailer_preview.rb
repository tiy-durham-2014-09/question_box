# Preview all emails at http://localhost:3000/rails/mailers/activation_mailer
class ActivationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/activation_mailer/account_activation
  def account_activation
    ActivationMailer.account_activation
  end

end

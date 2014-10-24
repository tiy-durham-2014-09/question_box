require 'test_helper'

class VerificationTest < ActionMailer::TestCase
  should "send a validation" do
    user = users(:one)
    mail = Verification.user_verification(user, "You are validated")
    assert_equal "Verify your account", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@questionbox.com"], mail.from
  end
end

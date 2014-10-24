require 'test_helper'

class SecurityMailerTest < ActionMailer::TestCase
  test "user_verification" do
	  user = users(:one)
    mail = SecurityMailer.user_verification(user.id)
    assert_equal "User verification for Question Box", mail.subject
    assert_equal ["one@example.org"], mail.to
    assert_equal ["no-reply@questionbox.com"], mail.from
    assert_match "Hello", mail.body.encoded
  end

end

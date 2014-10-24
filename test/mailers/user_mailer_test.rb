require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
 should "send registration confirmation" do
   user = users(:one)
   mail = UserMailer.registration_confirmation(user)
   assert_equal "Thanks for registering!", mail.subject
   assert_equal [user.email], mail.to
   assert_equal ["welcome@questionbox.com"], mail.from
 end
end

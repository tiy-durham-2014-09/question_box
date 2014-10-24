require 'test_helper'

class VerificationMailerTest < ActionMailer::TestCase
  context "With a new user" do
    setup do
      @user = User.new(name: Faker::Name.name,
                       email: Faker::Internet.email,
                       password: "password",
                       password_confirmation: "password")
      @user.save
    end
    should "send a verification email" do
      mail = VerificationMailer.email_verification(@user)
      assert_equal [@user.email], mail.to
      assert_equal ["noreply@Question.box"], mail.from
      assert_match "Thank you for joining Question Box!  Please click the following link to verify your account and begin asking and answering the most pressing questions of our time.", mail.body.encoded
    end
    # this isn't actually testing that the email is sent on user creation, duh
  end

end

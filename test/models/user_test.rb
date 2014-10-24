require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { users(:one) }

  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email).case_insensitive
  should validate_presence_of(:score)
  should validate_numericality_of(:score)
         .only_integer
         .is_greater_than_or_equal_to(0)

  should_not allow_value("BAD EMAIL").for(:email)
  should_not allow_value("@").for(:email)
  should_not allow_value("  clinton@example.org").for(:email)

  should have_secure_password

  should have_many(:questions)
  should have_many(:answers)
  should have_many(:votes)

  should "set key before validation" do
    user = User.new
    user.valid?
    assert_not_nil user.key
  end

  context "On creation" do
    setup do
      @user = User.new(name: Faker::Name.name,
                       email: Faker::Internet.email,
                       password: "password",
                       password_confirmation: "password")
      @user.save
    end

  end

end

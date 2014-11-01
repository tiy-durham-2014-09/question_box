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

  context "a user" do
    subject { users(:one) }
    setup do
      @user = users(:one)
      @question = questions(:one)
    end

    should "be able to set tags" do
      assert_empty @user.tags
      @user.tag_list = "ruby, activerecord"
      assert_equal 2, @user.tags.count
      assert_includes @user.tags.map(&:name), "ruby"
      assert_includes @user.tags.map(&:name), "activerecord"
    end

    should "know its tags' names" do
      @user.tag_list = "ruby, activerecord"
      assert_same_elements @user.tag_names, %w(ruby activerecord)
    end

    should "know its tag list" do
      @user.tag_list = "ruby, activerecord"
      assert_equal "ruby, activerecord", @user.tag_list
    end

    should "know questions related to favorited tags" do
      @user.tag_list     = "495027a5-f1d1-447b-aa1d-97471b780fed"
      @question.tag_list = "495027a5-f1d1-447b-aa1d-97471b780fed"
      assert_equal @user.tags.first.questions.first.title, @question.title
    end
  end
end

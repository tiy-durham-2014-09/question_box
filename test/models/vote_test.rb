require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:voteable)

  should validate_presence_of(:user)
  should validate_presence_of(:value)
  should validate_inclusion_of(:value).in_array([-1, 1])

  context "a vote" do
    setup do
      @voter = users(:voter)
      @vote = Vote.new(user: @voter)
    end

    should "not be on your own stuff" do
      @vote.voteable = Question.new(user: @voter)

      assert @vote.invalid?, "Cannot vote on your own stuff"
      assert_not_empty @vote.errors[:user]
    end

    should "be unique per user & voteable" do
      @vote.voteable = questions(:one)
      @vote.value = 1
      @vote.save!

      vote2 = users(:voter).votes.build(voteable: questions(:one), value: -1)
      refute vote2.valid?
      assert_includes vote2.errors[:user], "has already been taken"
    end
  end
end

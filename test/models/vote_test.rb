require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "Should have a user" do
    check_presence(@vote, :user)
  end

  test "should have value" do
    check_presence(@vote, :value)
  end


  test "Should be positive or negative one" do
      @vote.value = -2

      assert @vote.invalid?, "Vote should be 1 or -1"
      assert_not_empty @vote.errors[:value]
  end

  test "should award 10 points to user object" do
    user = users(:one)
    question = questions(:one)
    previous_score = user.score
    vote = question.votes.create!(:value => 1, :user => user)

    assert_equal 10, user.score - previous_score

  end

end

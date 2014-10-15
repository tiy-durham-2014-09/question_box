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

  test "should award 10 points to user object if positive" do
    reciever = users(:one)
    voter = users(:two)
    question = questions(:one)
    previous_score = reciever.score
    vote = question.votes.create!(:value => 1, :user => voter)
    reciever.reload

    assert_equal 10, reciever.score - previous_score
  end

  test "should subtract 5 points to user object if negative" do
    reciever = users(:one)
    voter = users(:two)
    question = questions(:one)
    previous_score = reciever.score
    vote = question.votes.create!(:value => -1, :user => voter)
    reciever.reload

    assert_equal -5, reciever.score - previous_score
  end


  # test "should subtract 1 point for voting negative" do
  #   user = users(:one)
  #   voter = users(:two)
  #   question = questions(:one)
  #   previous_score = voter.score
  #   vote = question.votes.create!(:value => -1, :user => user)
  #
  #   assert_equal -5, user.score - previous_score
  #
  # end

end

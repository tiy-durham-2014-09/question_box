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


  test "should be positive or negative 1" do
      @vote.value = -2

      assert @vote.invalid?, "Vote should be 1 or -1"
      assert_not_empty @vote.errors[:value]
  end

  test "should award 10 points to a question's owner if positive" do
    voter = users(:two)
    question = questions(:one)
    reciever = question.user
    previous_score = reciever.score
    vote = question.votes.create!(:value => 1, :user => voter)
    reciever.reload

    assert_equal 10, reciever.score - previous_score
  end

  test "should award 10 points to an answer's owner if positive" do
    voter = users(:two)
    answer = answers(:one_for_question_one)
    reciever = answer.user
    previous_score = reciever.score
    vote = answer.votes.create!(:value => 1, :user => voter)
    reciever.reload

    assert_equal 10, reciever.score - previous_score
  end

  test "should subtract 5 points from a question's owner if negative" do
    voter = users(:two)
    question = questions(:one)
    reciever = question.user
    previous_score = reciever.score
    vote = question.votes.create!(:value => -1, :user => voter)
    reciever.reload

    assert_equal -5, reciever.score - previous_score
  end

  test "should subtract 5 points from an answer's owner if negative" do
    voter = users(:one)
    answer = answers(:one_for_question_one)
    reciever = answer.user
    previous_score = reciever.score
    vote = answer.votes.create!(:value => -1, :user => voter)
    answer.user.reload

    assert_equal -5, reciever.score - previous_score
  end

  test "should subtract 1 point for voting negative" do
    voter = users(:one)
    question = questions(:one)
    previous_score = voter.score
    vote = question.votes.create!(:value => -1, :user => voter)

    assert_equal -1, voter.score - previous_score

  end

end

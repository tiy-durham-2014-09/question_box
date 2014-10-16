require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end
  test "is associated to a user" do
    check_presence(@vote, :user)
  end
  # test "belongs to voteable" do
  #   check_presence(@vote, :voteable_id)
  #   check_presence(@vote, :voteable_type)
  # end
  test "has a positive value" do
    vote = votes(:one)
    vote.update(value:-1)
    refute vote.is_positive?, "is_positive? should be false"

    vote.update(value:1)
    assert vote.is_positive?, "is_positive? should be true"
  end
  test "has a negative value" do
    vote = votes(:one)
    vote.update(value: 1)
    refute vote.is_negative?, "is_negative? should be false"

    vote.update(value:-1)
    assert vote.is_negative?, "is_negative? should be true"
 end
  test "has a valid value" do
    vote = votes(:one)
    vote.update(value: "A")
    refute vote.value_is_valid, "value should not be valid"

    vote.update(value: 1)
    assert vote.value_is_valid, "1 should be valid"

    vote.update(value:-1)
    assert vote.value_is_valid, "-1 should be valid"
  end
  test "10 points given to user who authored if vote is positive" do
    question = questions(:one)
    previous_score = question.user.score # = 0
    question.votes.create(user: users(:one), value: 1) #question now has a vote value of 1
    question.user.reload
    assert_equal 10,  question.user.score - previous_score
  end
  test "5 points taken from user who authored if vote is negative" do
    question = questions(:one)
    previous_score = question.user.score # = 0
    question.votes.create(user: users(:one), value: -1) #question now has a vote value of -1
    puts "question score #{question.user.score}"
    question.user.reload
    y = question.user.score
    puts "question score #{question.user.score}"
    # puts self.user.score
    assert_equal (5),  previous_score - y
  end
  test "1 point is taken from user casting vote if vote is negative" do

  end
end

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should have a user" do
    check_presence(@vote, :user)
  end

  test "should return value as true" do # returning true for voting up
    vote = votes(:one)
    assert vote.value?
  end

  test "should return value as false" do # returning false for voting down
    vote = votes(:two)
    refute vote.value?
  end

  test "should add 10 points from user of question when voted positive" do
    question = questions(:one)
     previous_score = question.user.score
     question.votes.create(value: true, user: users(:one))
     question.user.reload
     assert_equal 10, question.user.score - previous_score
   end


  test "should subtract 5 points from user of question when voted negative" do
    question = questions(:one)
     previous_score = question.user.score
     question.votes.create(value: false, user: users(:one))
     question.user.reload
     assert_equal (-4), previous_score - question.user.score
   end

#
#   test "should subtract 5 points from user of question/answer when voted negative" do
#   vote = votes(:one)
#   vote.where(value: true)
#   votes(:one).user.score.update -= 5
#
#
#   assert votes(:one).score, -4
#   end
#
#   test "should subtract 1 point from user who cast vote when vote is negative" do
#
#   end
#
end

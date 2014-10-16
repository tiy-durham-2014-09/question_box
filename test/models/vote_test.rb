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

#   test "should add 10 for true value" do
#     # vote = Vote.new(value: true)
#     # vote.save
#     Vote.where(value: true)
#     votes(:one).score += 10
#
#
#     assert votes(:one).score, 11
#   end
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


# question = questions(:one)
# answer = question.answers.first
# refute answer.chosen?

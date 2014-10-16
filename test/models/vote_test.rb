require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  setup do
    @vote = Vote.new
  end

  test "should belong to a user" do
    check_presence(@vote, :user)
  end

  test "should belong to a voteable" do
    check_presence(@vote, :voteable)
  end

  test "should have a value" do
    check_presence(@vote, :value)
  end

  test "should have an integer for value" do
    @vote.value = 3.14
    assert @vote.invalid?, "Vote should have an integer value"
    assert_not_empty @vote.errors[:value]
  end

  test "should not have a value greater than 1" do
    @vote.value = 3
    assert @vote.invalid?, "Vote value should not exceed 1"
    assert_not_empty @vote.errors[:value]
  end

  test "should not have a value less than -1" do
    @vote.value = -3
    assert @vote.invalid?, "Vote value should not be less than -1"
    assert_not_empty @vote.errors[:value]
  end

  # test "receiving a positive vote should give the user +10" do
  #   previous_score = user.score
  #   user.score.up_vote
  #   assert_equal previous_score + 10, user.score
  # end
  #
  # test "receiving a negative vote should give the user -5" do
  # end
  #
  # test "giving a negative vote should give the voter -1" do
  # end
end

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

  test "should have an integer for value" do
    @vote.value = 3.14
    assert @vote.invalid?, "Vote should have an integer value"
    assert_not_empty @vote.errors[:value]
  end

  test "should have only a positive or negative 1 for value" do
    @vote.value = -2
    assert @vote.invalid?, "Vote should have 1 or -1 as value"
    assert_not_empty @vote.errors[:value]

    @vote.value = 7
    assert @vote.invalid?, "Vote should have 1 or -1 as value"
    assert_not_empty @vote.errors[:value]
  end

  # test "should decrease user's score by 1 when negative"
  # test "should increase voteable's user's score by 10 when positive"
  # test "should decrease voteable's user's score by 5 when negative"


end

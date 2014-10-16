require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should belong to a user" do
    check_presence(@vote, :user)
  end

  # a polymorphic association
  test "should belong to a voteable" do
    check_presence(@vote, :voteable_id)
    check_presence(@vote, :voteable_type)
  end

  test "should have a positive or negative integer for a value" do
    @vote.value = 1.23
    assert @vote.invalid?, "Vote should have an integer value"
    assert_not_empty @vote.errors[:value]
  end

  #Not sure how to do this mathy test
  #test "should be worth +10 points to a user when something (a question or answer) they created is given a positive vote" do
  #end

  #Not sure how to do this mathy test
  #test "should be worth -5 points to a user when something (a question or answer) they created is given a negative vote" do
  #end

  #Not sure how to do this mathy test
  #test "should be worth -1 points to a user when they make a negative vote" do
  #end
end

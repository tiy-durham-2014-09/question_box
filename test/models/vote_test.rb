require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should belong to a user" do
    check_presence(@vote, :user)
  end

  #I am not sure how to properly test a polymorphic association
  test "should belong to a commentable" do
  end

  #Not sure how to do this mathy test
  test "should have a positive or negative integer for a score" do
  end

  #Not sure how to do this mathy test
  test "should be worth +10 points to a user when something (a question or answer) they created is given a positive vote" do
  end

  #Not sure how to do this mathy test
  test "should be worth -5 points to a user when something (a question or answer) they created is given a negative vote" do
  end

  #Not sure how to do this mathy test
  test "should be worth -1 points to a user when they make a negative vote" do
  end
end

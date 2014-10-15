require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should belong to user" do
    check_presence(@vote, :user)
  end

  test "should have a positive or negative value" do
  end

  test "should award 10 points to user of question/answer when voted positive" do
  end

  test "should subtract 5 points from user of question/answer when voted negative" do
  end

  test "should subtract 1 from user who casted vote when vote is negative" do
  end

end

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
    assert @vote.invalid?, "Vote should not be less than -1"
    assert_not_empty @vote.errors[:value]

    @vote.value = 7
    assert @vote.invalid?, "Vote should be more than 1"
    assert_not_empty @vote.errors[:value]

  end

  test "should decrease user's score by 1 when created as negative" do
    voter = users(:one)
    question = questions(:two)
    assert_difference 'voter.score', -1 do
      question.votes.create!(value: -1, user: voter)
    end

    # assert_no_difference 'voter.score', do
    #   question.votes.create!(value: 1, user: voter)
    # end
  end

  test "should increase voteable's user's score by 10 when created as positive" do
    question = questions(:two)
    voter = users(:one)
    author = users(:chet)
    assert_difference 'author.score', 10 do
      question.votes.create!(value: 1, user: voter)
      author.reload
    end

  end

  # test "should decrease voteable's user's score by 5 when created as negative"
  # test "should not be created a second time for the same user on the same voteable"

end

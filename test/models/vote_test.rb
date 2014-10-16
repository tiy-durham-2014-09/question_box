require 'test_helper'

class VoteTest < ActiveSupport::TestCase
	setup do
		@vote = Vote.new
	end

	test "should belong to a user" do
		check_presence(@vote, :user)
	end

	test "should belong to voteable" do
		check_presence(@vote, :voteable_id)
		check_presence(@vote, :voteable_type)
  end

  test "should award 10 pts to ques/answer creator for an up vote" do
    question = questions(:one)
    voter = users(:two)

    Vote.create!(up: true, voteable_id: question.id, voteable_type: "Question", user: voter)

    creator = question.user
    assert_equal 11, creator.score
  end

  test "should deduct 5 pts to ques/answer creator and 1 pt to voter for a down vote" do
    question1 = questions(:two)
    voter1 = users(:two)

    Vote.create!(voteable_id: question1.id, voteable_type: "Question", user: voter1)

    creator1 = question1.user
    voter_post = users(:two)

    assert_equal 995, creator1.score
    assert_equal 0, voter_post.score

  end

end

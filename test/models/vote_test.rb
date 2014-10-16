require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # def vote (up,model)
  #   if model == "Question"
  #     model = questions(:one)
  #   elsif model == "Answer"
  #     model = answers(:one)
  #   end
  #
  #   voter = users(:two)
  #
  #   Vote.create_vo
  #   Vote.create!(up: true, voteable_id: question.id, voteable_type: "Question", user: voter)
  #
  #
  #   creator1 = question.user
  # end
  #
  # end
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

    creator1 = question.user
    assert_equal 11, creator1.score
  end

  test "should deduct 5 pts from ques/answer creator for a down vote" do
    question1 = questions(:two)
    voter1 = users(:two)

    Vote.create!(voteable_id: question1.id, voteable_type: "Question", user: voter1)

    creator1 = question1.user
    voter_post = users(:two)

    assert_equal 995, creator1.score
  end

  test "should deduct 1 pt to voter for a down vote" do
    question1 = questions(:two)
    voter1 = users(:two)

    Vote.create!(voteable_id: question1.id, voteable_type: "Question", user: voter1)

    creator1 = question1.user
    voter_post = users(:two)

    assert_equal 0, voter_post.score
  end

end

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

	test "should award 10 points for an up vote to the user who created ques/ans" do
    question = questions(:one)
    user = question.user

    assert_difference 'user.score', 10 do
      vote = Vote.create!(up: true, voteable_id: question.id, voteable_type: "Question",user: user)
    end
  end

  test "should deduct points for a down vote to the user who created ques/ans" do
    question = questions(:one)
    user = question.user

    assert_difference 'user.score', -5 do
      vote = Vote.create!(voteable_id: question.id, voteable_type: "Question",user: user)
    end
  end

end

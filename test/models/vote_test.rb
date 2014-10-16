require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def make_vote (up_val,model_str,model_fixture_key = :one,voter_fixture_key = :two)
    if model_str == "Question"
      model = questions(model_fixture_key)
    elsif model_str == "Answer"
      model = answers(model_fixture_key)
    end

    voter = users(voter_fixture_key)

    Vote.create!(up: up_val, voteable_id: model.id, voteable_type: model_str, user: voter)

    {:voter => voter, :creator => model.user}
  end

	setup do
		@vote = Vote.new
	end

	test "should have a user" do
		check_presence(@vote, :user)
	end

	test "should be voteable" do
		check_presence(@vote, :voteable_id)
		check_presence(@vote, :voteable_type)
  end

  test "should award 10 pts to question creator for an up vote" do
    vote_players = make_vote(true,"Question")
    assert_equal 11, vote_players[:creator].score
  end

  test "should award 10 pts to answer creator for an up vote" do
    vote_players = make_vote(true,"Answer")
    assert_equal 11, vote_players[:creator].score
  end

  test "should deduct 5 pts from question creator for a down vote" do
    vote_players = make_vote(false,"Question",:two,:one)

    assert_equal 995, vote_players[:creator].score
  end

  test "should deduct 5 pts from answer creator for a down vote" do
    vote_players = make_vote(false,"Answer",:two,:one)

    assert_equal 995, vote_players[:creator].score
  end

  test "should deduct 1 pt to voter for a down vote" do
    vote_players = make_vote(false,"Question")

    assert_equal 0, vote_players[:voter].score

    vote_players = make_vote(false,"Answer",:two,:one)

    assert_equal 0, vote_players[:voter].score
  end

end

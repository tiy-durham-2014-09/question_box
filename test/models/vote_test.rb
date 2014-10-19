require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:voteable)

  should validate_presence_of(:user)
  should validate_presence_of(:value)
  should validate_inclusion_of(:value).in_array([-1, 1])

  context "a vote" do
    setup do
      @voter = users(:voter)
      @vote = Vote.new(user: @voter)
    end

    should "not be on your own stuff" do
      @vote.voteable = Question.new(user: @voter)

      assert @vote.invalid?, "Cannot vote on your own stuff"
      assert_not_empty @vote.errors[:user]
    end

    context "that is positive" do
      should "award 10 points to a question's owner" do
        question = questions(:one)
        receiver = question.user

        assert_difference "receiver.score", 10 do
          question.votes.create!(:value => 1, :user => @voter)
          receiver.reload
        end
      end

      should "award 10 points to an answer's owner" do
        answer = answers(:one_for_question_one)
        receiver = answer.user

        assert_difference "receiver.score", 10 do
          answer.votes.create!(:value => 1, :user => @voter)
          receiver.reload
        end
      end
    end

    context "that is negative" do
      should "subtract 5 points from a question's owner if negative" do
        question = questions(:one)
        receiver = question.user

        assert_difference "receiver.score", -5 do
          question.votes.create!(:value => -1, :user => @voter)
          receiver.reload
        end
      end

      should "subtract 5 points from an answer's owner if score >= 5" do
        answer = answers(:one_for_question_one)
        receiver = answer.user
        receiver.update(score: 10)

        assert_difference "receiver.score", -5 do
          answer.votes.create!(:value => -1, :user => @voter)
          receiver.reload
        end
      end

      should "subtract all points from an answer's owner if score < 5" do
        answer = answers(:one_for_question_one)
        receiver = answer.user
        receiver.update(score: 2)

        answer.votes.create!(:value => -1, :user => @voter)
        answer.user.reload

        assert_equal 0, receiver.score
      end

      should "subtract 1 point for voting negative" do
        question = questions(:one)

        assert_difference "@voter.score", -1 do
          question.votes.create!(:value => -1, :user => @voter)
        end
      end
    end
  end
end


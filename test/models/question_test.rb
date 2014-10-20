require 'test_helper'

class QuestionTest < ActiveSupport::TestCase


  should validate_presence_of(:title)
  should validate_presence_of(:text)
  should validate_presence_of(:user)

  should belong_to(:user)
  should have_many(:answers)
  should have_many(:votes)

  context "a question" do
    subject { questions(:one) }
    setup do
      @question = questions(:one)
    end

    should "know if it has a chosen answer" do
      @question.answers.update_all(chosen: false)
      refute @question.has_chosen_answer?, "has_chosen_answer? should be false"

      @question.answers.first.update(chosen: true)
      assert @question.has_chosen_answer?, "has_chosen_answer? should be true"
    end
    #
    # should "know its own vote_count" do
    #   voter3 = users(:voter3)
    #   @question.votes.create!(:value => 1, :user => voter3)
    #
    #   assert_equal 1, @question.vote_count
    # end

    should "know its answer count" do
      question = Question.new
      assert_equal 0, question.answer_count, "answer count should be zero for new question"

      question = questions(:one)
      assert_equal 3, question.answer_count, "answer count should equal number of related answers"
    end

  end
  #
  # test "should increment vote count by 1 after up vote" do
  #   question = questions(:one)
  #   voter = users(:two)
  #
  #   Vote.create!(up: true, voteable_id: question.id, voteable_type: "Question", user: voter)
  #
  #   question1 = Question.find(question.id)
  #   assert_equal 1, question1.vote_count
  # end
  #
  # test "should decrement vote count by 1 after down vote" do
  #   question = questions(:one)
  #   voter = users(:two)
  #
  #   Vote.create!(voteable_id: question.id, voteable_type: "Question", user: voter)
  #
  #   question1 = Question.find(question.id)
  #   assert_equal -1, question1.vote_count
  # end

end








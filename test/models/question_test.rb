require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = Question.new
  end

  test "should have a title" do
    check_presence(@question, :title)
  end

  test "should have text" do
    check_presence(@question, :text)
  end

  test "should belong to a user" do
    check_presence(@question, :user)
  end

  test "should know if it has a chosen answer" do
    question = questions(:one)
    question.answers.update_all(chosen: false)
    refute question.has_chosen_answer?, "has_chosen_answer? should be false"

    question.answers.first.update(chosen: true)
    assert question.has_chosen_answer?, "has_chosen_answer? should be true"
  end

  test "should be able to tally its votes and give a score" do
    new_question = questions(:one)
    new_question.votes.build(value: 1, user: users(:one))
    assert new_question.score == 1
    #
    # @question.votes.build(value: 1, user: users(:one))
    # assert @questions.score == 2
    #
    # @question.votes.build(value: -1, user: users(:one))
    # @question.votes.build(value: -1, user: users(:one))
    # @question.votes.build(value: -1, user: users(:one))
    # assert @questions.score == -1
  end
end








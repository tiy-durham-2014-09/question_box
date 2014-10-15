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

  test "should know its own score" do
    question = questions(:one)
    voter1 = users(:two)
    voter2 = users(:one)
    vote1 = question.votes.create!(:value => 1, :user => voter1)
    vote2 = question.votes.create!(:value => 1, :user => voter2)

    assert_equal 2, question.total_score

  end
end

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

  test "should increment vote count by 1 after up vote" do
    question = questions(:one)
    voter = users(:two)

    Vote.create!(up: true, voteable_id: question.id, voteable_type: "Question", user: voter)

    question1 = Question.find(question.id)
    assert_equal 1, question1.vote_count
  end

  test "should decrement vote count by 1 after down vote" do
    question = questions(:one)
    voter = users(:two)

    Vote.create!(voteable_id: question.id, voteable_type: "Question", user: voter)

    question1 = Question.find(question.id)
    assert_equal -1, question1.vote_count
  end

end








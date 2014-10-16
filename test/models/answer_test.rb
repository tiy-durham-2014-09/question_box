require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @answer = Answer.new
  end

  test "should have text" do
    check_presence(@answer, :text)
  end

  test "should have a user" do
    check_presence(@answer, :user)
  end

  test "should have a question" do
    check_presence(@answer, :user)
  end

  test "should only allow one chosen answer per question" do
    chosen_answer = answers(:one_for_question_one)
    chosen_answer.update(chosen: true)
    @answer.question = chosen_answer.question
    @answer.chosen = true

    assert @answer.invalid?, "Only one answer can be chosen per question"
    assert_not_empty @answer.errors[:chosen]
  end

  test "should allow it to be the first chosen answer" do
    question = questions(:one)
    answer = question.answers.build(chosen: true)

    answer.valid?
    assert_empty @answer.errors[:chosen]
  end

  test "should award its user 100 points when chosen" do
    question = questions(:one)
    answer = question.answers.first
    refute answer.chosen?
    assert_difference 'answer.user.score', 100 do
      answer.update(chosen: true)
    end
  end

  # test

end

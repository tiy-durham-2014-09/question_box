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

  test "should have many comments" do
    check_presence(@question, :comments)
  end

  test "should have many votes" do
    check_presence(@question, :votes)
  end

  # test "should have a value from votes" do
  #   check_presence(@question, :value)
  # end
  #
  # test "should have an integer for value" do
  #   @question.value = 3.14
  #   assert @question.invalid?, "Question should have an integer for value"
  #   assert_not_empty @user.errors[:score]
  # end
end

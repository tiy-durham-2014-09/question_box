require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:text)
  should validate_presence_of(:user)

  should belong_to(:user)
  should have_many(:answers)

  context "a question" do
    should "know if it has a chosen answer" do
      question = questions(:one)
      question.answers.update_all(chosen: false)
      refute question.has_chosen_answer?, "has_chosen_answer? should be false"

      question.answers.first.update(chosen: true)
      assert question.has_chosen_answer?, "has_chosen_answer? should be true"
    end
  end
end








require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  def valid_answer_attributes(question_id)
    {text: Faker::Lorem.sentence,
     user_id: users(:one).id,
     question_id: questions(:one).id}
  end

  def invalid_answer_attributes
    {text:  "",
     user_id: "",
     question_id: ""}
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { answer: invalid_answer_attributes }, { 'current_user_id' => users(:one).id } }

      should "re-render the form" do
        redirect_to(show_questions_path)
      end

    end

    # context "when I send valid information" do
    #   should "create a question" do
    #     question_attributes = valid_question_attributes
    #     post :create, { question: question_attributes }, { 'current_user_id' => users(:one).id }
    #
    #     assert assigns["question"], "Should have a question"
    #
    #     assert assigns["question"].persisted?, "Should have saved question in the DB"
    #     assert_equal question_attributes[:title], assigns["question"].title
    #   end
    # end


  end

  # context "When I choose an answer" do
  #   should "Have a chosen answer" do
  #     question_attributes = valid_question_attributes
  #     q = post :create, { question: question_attributes }, { 'current_user_id' => users(:one).id }
  #
  #
  #
  #     assert assigns["question"], "Should have a question"
  #     q_id = assigns["question"].id
  #     a = post :create, { answer: valid_answer_attributes(q_id) }, { 'current_user_id' => users(:one).id }
  #
  #     assert question.has_chosen_answer, "Should have a chosen answer"
  #   end
  # end
end

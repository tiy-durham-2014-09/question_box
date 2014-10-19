require 'test_helper'

class AnswersControllerTest < ActionController::TestCase

  def invalid_answer_attributes
    {text: "",
     vote_count: "",
     user_id: "",
     question_id: questions(:one).id}
  end

  def valid_answer_attributes
    answers(:one).attributes
  end

  # context "POST :create" do
  #   context "when I send invalid information" do
  #     setup do
  #       @request.env['HTTP_REFERER'] = question_url(questions(:one))
  #       question = questions(:one)
  #       post :create, { answer: invalid_answer_attributes }
  #     end
  #
  #     should "send back to question show" do
  #       assert_redirected_to :back
  #     end
  #
  #     should "instantiate an invalid answer object" do
  #       assert assigns["answer"], "Should have a answer"
  #       assert assigns["answer"].invalid?, "Should have an invalid answer"
  #     end
  #   end
  #
  #   context "when I send valid information" do
  #     setup do
  #       @answer_attributes = valid_answer_attributes
  #       post :create, { answer: @answer_attributes }
  #     end
  #
  #     should "create a answer" do
  #       assert assigns["answer"], "Should have a answer"
  #       assert assigns["answer"].persisted?, "Should have saved answer in the DB"
  #       assert_equal @answer_attributes["text"], assigns["answer"].text, "Should have text"
  #       assert_equal @answer_attributes["user_id"], assigns["answer"].user_id, "Should have a user id"
  #       assert_equal @answer_attributes["question_id"], assigns["answer"].question_id, "Should have a question id"
  #       assert_equal 0, assigns["answer"].vote_count, "Should have a zero vote count"
  #     end
  #
  #     should "show answer" do
  #       assert_redirected_to question_path(assigns["answer"].question_id), "Should redirect to show question"
  #     end
  #   end
  #
  #   context "DELETE" do
  #     context "when I delete a answer" do
  #       setup do
  #         @answer = answers(:one)
  #         @answer_id = @answer.id
  #         @question_id = @answer.question
  #       end
  #
  #       should "user should be removed from database" do
  #         assert_raise ActiveRecord::RecordNotFound do
  #           delete :destroy, { question_id: @question_id, id: @answer_id }
  #           Answer.find(@answer_id)
  #         end
  #       end
  #
  #       should "send to question show" do
  #         delete :destroy, { question_id: @question_id, id: @answer_id }
  #         assert_redirected_to question_path(@question_id), "should send to question show page"
  #       end
  #     end
  #   end
  #
  # end

end

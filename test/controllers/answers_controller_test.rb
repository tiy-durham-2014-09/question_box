require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  # def invalid_answer_data
  #   { text: "" }
  # end
  #
  # def valid_answer_data
  #   { text: Faker::Hacker.say_something_smart }
  # end
  #
  # context "POST answers#create" do
  #   context "when not logged in" do
  #     setup { post :create, question_id: questions(:one).id, answer: {} }
  #
  #     should "redirect to login" do
  #       assert_redirected_to login_path
  #     end
  #   end
  #
  #   context "when logged in" do
  #     context "with invalid data" do
  #       setup do
  #         post :create, { question_id: questions(:one).id, answer: invalid_answer_data }, logged_in_session
  #       end
  #
  #       should render_template("questions/show")
  #
  #       should "instantiate an invalid answer object" do
  #         assert_invalid_model(:answer)
  #       end
  #     end
  #
  #     context "with valid data" do
  #       setup do
  #         post :create, { question_id: questions(:one).id, answer: valid_answer_data }, logged_in_session
  #       end
  #
  #       should "create an answer" do
  #         assert_saved_model(:answer)
  #       end
  #
  #       should "redirect to question" do
  #         assert_redirected_to questions(:one)
  #       end
  #     end
  #   end
  # end
end

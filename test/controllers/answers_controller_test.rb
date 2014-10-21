require 'test_helper'

class AnswersControllerTest < ActionController::TestCase

  def invalid_answer_attributes
    { text: "" }
  end

  def valid_answer_attributes
    { text: "this is the answer" }
  end

  context "POST answers#create" do
    context "when user is not logged in" do
      setup do
        @question = questions(:one)
        post :create, { question_id: @question.id }, { answer: invalid_answer_attributes }
      end

      should "redirect to new login" do
        assert_redirected_to new_login_path, "should redirect to new login"
      end
    end

    context "when user is logged in" do

      context "when I send invalid information" do
        setup do
          post :create, { question_id: questions(:one).id, answer: invalid_answer_attributes }, logged_in_session
        end

        should "instantiate an invalid answer object" do
          assert assigns[:answer], "Should have a answer"
          assert assigns[:answer].invalid?, "Should have an invalid answer"
        end

        should render_template("questions/show")
      end

      context "when I send valid information" do
        setup do
          post :create, { question_id: questions(:one).id, answer: valid_answer_attributes }, logged_in_session
        end

        should "create a answer" do
          assert assigns["answer"], "Should have a answer"
          assert assigns["answer"].persisted?, "Should have saved answer in the DB"
        end

        should "show answer" do
          assert_redirected_to questions(:one), "Should redirect to show question"
        end
      end

    end

    context "PATCH :update" do
      context "when a question creator chooses answer" do
        should "change chosen to true" do
          patch :update, { id: answers(:one), chosen: true }, logged_in_session
          assert answers(:one).reload.chosen, "should change boolean"
        end
      end
    end

  end

end

require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def invalid_question_attributes
    {title: "",
     text: ""}
  end

  def valid_question_attributes
    questions(:one).attributes
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup do
        session[:user_id] = users(:one).id
        @controller.send(:current_user)
        post :create, { question: invalid_question_attributes }
      end

      should "re-render the form" do
        assert_template :new
      end

      should "instantiate an invalid question object" do
        assert assigns["question"], "Should have a question"
        assert assigns["question"].invalid?, "Should have an invalid question"
      end
    end

    context "when I send valid information" do
      setup do
        session[:user_id] = users(:one).id
        @controller.send(:current_user)
        @question_attributes = valid_question_attributes
        post :create, { question: @question_attributes }
        session[:user_id] = users(:one).id
      end

      should "create a question" do
        assert assigns["question"], "Should have a question"
        assert assigns["question"].persisted?, "Should have saved question in the DB"
        assert_equal @question_attributes["title"], assigns["question"].title, "Should have a title"
        assert_equal @question_attributes["text"], assigns["question"].text, "Should have text"
        assert_equal @question_attributes["user_id"], assigns["question"].user_id, "Should have a user id"
        assert_equal 0, assigns["question"].vote_count, "Should have a zero vote count"
      end

      should "show question" do
        assert_redirected_to question_path(assigns["question"].id), "Should redirect to show question"
      end
    end

  end

  context "DELETE" do
    context "when I delete a question" do
      setup do
        session[:user_id] = users(:one).id
        @controller.send(:current_user)
      end

      should "user should be removed from database" do
        assert_raise ActiveRecord::RecordNotFound do
          question_id = questions(:one).id
          delete :destroy, { id: question_id }
          Question.find(question_id)
        end
      end

      should "send to homepage" do
        question_id = questions(:one).id
        delete :destroy, { id: question_id }
        assert_redirected_to root_path, "should send to homepage"
      end
    end
  end

end

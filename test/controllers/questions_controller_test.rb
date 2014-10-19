require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def invalid_question_attributes
    {title: "",
     text: ""}
  end

  def valid_question_attributes
    questions(:one).attributes
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { question: invalid_question_attributes } }

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
        @question_attributes = valid_question_attributes
        post :create, { question: @question_attributes }
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
end

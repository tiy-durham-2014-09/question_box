require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def valid_question_attributes
    {title: Faker::Company.catch_phrase + '?',
     text: Faker::Company.bs,
     user: 1}
  end

  def invalid_question_attributes
    {title: nil,
     text: nil,
     user: nil}
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { user: invalid_question_attributes } }

      should "re-render the form" do
        assert_template :new
      end

      should "instantiate an invalid user object" do
        assert assigns["question"], "Should have a question"
        assert assigns["question"].invalid?, "Should have an invalid question"
      end
    end

    context "when I send valid information" do
      should "create a question" do
        question_attributes = valid_question_attributes
        post :create, { question: question_attributes }

        assert assigns["question"], "Should have a question"
        # binding.pry
        assert assigns["question"].persisted?, "Should have saved question in the DB"
        assert_equal question_attributes[:name], assigns["question"].name
      end
    end
  end

end

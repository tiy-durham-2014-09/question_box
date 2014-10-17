require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def valid_question_attributes
    {title: Faker::Lorem.sentence,
     text: Faker::Lorem.sentence(3)}
  end

  def invalid_question_attributes
    {title: "",
     text: ""}
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { question: invalid_question_attributes } }

      should "re-render the form" do
        assert_template :create
      end

      should "instantiate an invalid question object" do
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

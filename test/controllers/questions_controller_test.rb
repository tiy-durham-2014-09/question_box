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
      setup { post :create, { question: invalid_question_attributes }, { 'current_user_id' => users(:one).id } }

      should "re-render the form" do
        redirect_to(root_path)
      end

    end

    context "when I send valid information" do
      should "create a question" do
        question_attributes = valid_question_attributes
        post :create, { question: question_attributes }, { 'current_user_id' => users(:one).id }

        assert assigns["question"], "Should have a question"

        assert assigns["question"].persisted?, "Should have saved question in the DB"
        assert_equal question_attributes[:title], assigns["question"].title
      end
    end


  end

end

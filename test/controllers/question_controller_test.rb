require 'test_helper'

class QuestionControllerTest < ActionController::TestCase
  def valid_question_attributes
    {title: "title",
     text: "text",
     user_id: 1
     }
  end

  def invalid_question_attributes
    {title: 4,
     text: 3,
     user_id: 1}
  end

context "POST :create" do
  context "when I send invalid information" do
    setup { post :create, { user: invalid_question_attributes } }

    should "render new" do
      assert_redirected_to root_path
    end

  end

  context "when I send valid information" do
    should "create a user" do
      question_attributes = valid_question_attributes
      post :create, { user: question_attributes }

    end
  end
end
end

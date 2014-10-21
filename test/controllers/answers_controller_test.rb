require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  context "POST :create" do
    setup do
      @user = users(:one)
      @question = questions(:one)
    end
    context "When I send invalid answer info" do
      setup do
        post :create, { answer: { text: "", user_id: @user.id, question_id: @question.id } },
             { current_user_id: @user.id }
      end
      should "reload question page" do
        assert_redirected_to question_path(@question)
      end
      should "instantiate an invalid answer object" do
        assert assigns["answer"], "Should have an answer"
        assert assigns["answer"].invalid?, "Should have an invalid answer"
      end
    end
    context "When I send valid info" do
      setup do
        post :create, { answer: { text: "i got nothin", user_id: @user.id, question_id: @question.id } },
             { current_user_id: @user.id }
      end
      should "instantiate an valid answer object" do
        assert assigns["answer"], "Should have an answer"
        assert assigns["answer"].valid?, "Should have an valid answer"
      end
      # should "reload question page with answer displayed" do
      #    question_path(assigns(:question))
      # end
    end
  end

end

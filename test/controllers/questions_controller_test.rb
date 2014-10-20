require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  context "GET :index" do
    setup { get :index }
    should respond_with(:ok)
    should render_template(:index)
  end

  context "GET :home" do
    context "While not logged in" do
      setup { get :home }
      should respond_with(:ok)
      should render_template(:home)
      should_not render_template(partial: 'new')
    end
    context "While logged in" do
      setup { get :home, {current_user_id: users(:one).id} }
      should respond_with(:ok)
      should render_template(:home)
      should render_template(partial: 'new')
    end
  end

  context "POST :create" do
    setup do
      @user = users(:one)
    end
    context "When I send invalid info" do
      setup do
        post :create, { question: { title: "", text: "", user_id: @user.id } },
             { current_user_id: @user.id }
      end
      should "reload home" do
        assert_redirected_to root_path
      end
    end
    context "When I send valid info" do
      setup do
        post :create, { question: { title: "wat", text: "how do i even", user_id: @user.id } },
             { current_user_id: @user.id }
      end

      should "show question" do
        assert_redirected_to question_path(assigns(:question))
      end
    end
  end

  context "GET :show" do
    setup { get :show, { id: questions(:one) } }
    should respond_with(:ok)
    should render_template(:show)
  end

end

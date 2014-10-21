require 'test_helper'

class LoginsControllerTest < ActionController::TestCase



    test "should bring up login" do
      get :new
     assert_template :new
     assert_response :success
     end

     test "should let user login" do
          post :create
       assert_response :success
      end

      context "POST logins#create" do
    context "when I send invalid info" do
      setup { post :create, login: { email: users(:one).email, password: "" } }

      should render_template(:new)

    end
  end
  context "DELETE logins#destroy" do
    setup { delete :destroy, {}, logged_in_session }

    should "redirect to question homepage" do
      assert_redirected_to root_path
    end

    should "log out" do
      assert_nil session[:current_user_id]
    end
  end

  context "POST login#create" do
    context "when not logged in" do
      setup { post :create }

      should "redirect to login" do
        assert_redirected_to login_path
      end
    end
end

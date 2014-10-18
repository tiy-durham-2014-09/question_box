require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  context "GET logins#show" do
    setup { get :show }

    should respond_with(:ok)
    should render_template(:show)

    should "instantiate a login object" do
      assert assigns[:login], "Should have a login"
    end
  end

  context "POST logins#create" do
    context "when I send invalid info" do
      setup { post :create, { login: { email: users(:one).email, password: "" } } }

      should render_template(:show)

      should "instantiate an invalid login object" do
        assert assigns["login"], "Should have a login"
        assert assigns["login"].invalid?, "Should have an invalid login"
      end
    end

    context "when I send valid info" do
      setup { post :create, { login: { email: users(:one).email, password: default_password } } }

      should "create a login" do
        assert assigns["login"], "Should have a login"
        assert assigns["login"].valid?, "Should have a valid login"
      end

      should "log in" do
        assert_equal assigns[:login].user.id, session[:current_user_id]
      end

      should_eventually "redirect to home"
    end
  end
end

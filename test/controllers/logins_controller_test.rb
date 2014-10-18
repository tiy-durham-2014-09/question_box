require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
	def valid_login_attributes
		{email: users(:one).email,
		 password: "password"}
	end

	def invalid_login_attributes
		{email: "",
		 password: ""}
	end

	context "POST :create" do
		context "when I send invalid information" do
			setup { post :create, { user: invalid_login_attributes } }

			should "re-render the form" do
				assert_template :new, "should show new template if invalid login"
			end
		end

		context "when I send valid information" do
			setup { post :create, { user: valid_login_attributes } }

			should "create new session with user id" do
				assert_equal session[:user_id], User.find_by(email: assigns["user"].email).id, "should set session user_id to new user id"
      end

      should "set current user" do
        user = @controller.send(:current_user)
        assert_equal user, assigns["user"], "should set current user variable to logged in user"
      end

      should "know if I am logged in" do
        assert_not_nil @controller.send(:logged_in?), "should know if I am logged in"
      end

			should "redirect to homepage" do
				assert_redirected_to root_path "should redirect to root"
			end
		end
  end

  context "DELETE" do
    context "when I log out" do
      setup { delete :destroy, id: users(:one).id }

      should "set clear out session" do
        assert_nil session[:user_id], "should have no session user id"
      end

      should "send to login page" do
        assert_redirected_to new_login_path, "should send to login page"
      end
    end
  end
end

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
				assert_equal session[:current_user_id], User.find_by(email: assigns["user"].email).id, "Should set session user_id to new user id"
			end

			should "redirect to homepage" do
				assert_redirected_to root_path "Should redirect to root"
			end
		end

		context "if I am logged in" do
			should "set current user" do
				user = current_user
				assert_equal user, User.find_by(email: assigns["user"].email), "should set current user variable to logged in user"
			end
		end
	end
end

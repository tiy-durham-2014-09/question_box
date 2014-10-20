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

	context "GET logins#new" do
		setup { get :new }

		should respond_with(:ok)
		should render_template(:new)
	end

	context "POST logins#create" do
		context "when I send invalid information" do
			setup { post :create, invalid_login_attributes }

			should "re-render the form" do
				assert_template :new
			end
		end

		context "when I send valid information" do
			setup { post :create, valid_login_attributes }

			should "create new session with user id" do
				assert_equal User.find_by(email: valid_login_attributes[:email]).id, session[:user_id]
      end

      should "set user as current user" do
        user = @controller.send(:current_user)
        assert_equal User.find_by(email: valid_login_attributes[:email]), user
      end

      should "know if I am logged in" do
        assert_not_nil @controller.send(:logged_in?)
      end

			should "redirect to homepage" do
				assert_redirected_to root_path
			end
		end
  end

  context "DELETE logins#destroy" do
    context "when I log out" do
      setup do
        post :create, valid_login_attributes
        delete :destroy, id: users(:one).id
      end

      should "set clear out session" do
        assert_nil session[:user_id]
      end

      should "send to homepage" do
        assert_redirected_to root_path
      end
    end
  end
end

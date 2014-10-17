require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  def invalid_login_attributes
    {email: users(:one).email,
     password: "",}
  end

  def valid_login_attributes
    {email: users(:one).email,
     password: "password"}
  end

  context "GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template(:new)
  end

  context "POST :create" do
    context "with invalid login info" do
      setup { post :create, invalid_login_attributes }
      should "re-render the form" do
        assert_template :new
      end
    end

    context "with valid login info" do
      setup { post :create, valid_login_attributes }
      should "create a session" do

        assert session[:current_user_id], "Should have a session"

      end
      should "redirect to homepage" do
        assert_redirected_to root_path
      end
    end

  end

  # context "DELETE :destroy" do
  #   setup { delete :destroy { ??? }}
  #   should "delete the login" do
  #     refute ???
  #   end
  # end
end

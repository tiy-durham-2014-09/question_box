require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  def valid_login_attributes
    {email: Faker::Internet.email,
     password: "password" }
  end
  def invalid_login_attributes
    {email: "",
     password: "" }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { user: invalid_login_attributes } }

      should "re-render the form" do
        assert_template :new
      end
    end

    context "when I send valid information" do
      setup {post :create, {user: valid_login_attributes }}
      should "create a session" do
        session_attributes = valid_login_attributes
        post :create,  session_attributes
      #NEED TO FIGURE THIS OUT  # assert session[:current_user_id], "should have a session"
      end
    end
  end
end

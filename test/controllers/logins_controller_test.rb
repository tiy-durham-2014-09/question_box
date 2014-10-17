require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def valid_user_attributes
    {email: users(:one).email,
     password: users(:one).password}
  end

  def invalid_user_attributes
    {email: "",
     password: ""}
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { login: invalid_user_attributes } }

      should "re-render the form" do
        assert_template :new
      end

    end

    context "when I send valid information" do
      should "login" do
        flunk "I'll get back to this"
      end
    end
  end

end
require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def valid_user_attributes
    {email: Faker::Internet.email,
     password: "password"}
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

    # context "when I send valid information" do
    #   should "create a user" do
    #     user_attributes = valid_user_attributes
    #     post :create, { user: user_attributes }
    #
    #     assert assigns["user"], "Should have a user"
    #   end
    # end
  end

end

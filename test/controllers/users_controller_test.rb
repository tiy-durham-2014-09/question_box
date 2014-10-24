require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def valid_user_attributes
    {name: Faker::Name.name,
     email: Faker::Internet.email,
     password: "password",
     password_confirmation: "password"}
  end

  def invalid_user_attributes
    {name: "",
     email: "",
     password: "",
     password_confirmation: ""}
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  context "POST :create" do
    context "when I send invalid information" do
      setup { post :create, { user: invalid_user_attributes } }

      should "re-render the form" do
        assert_redirected_to new_user_path
      end

      should "instantiate an invalid user object" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].invalid?, "Should have an invalid user"
      end
    end

    context "when I send valid information" do
      should "create a user" do
        user_attributes = valid_user_attributes
        post :create, { user: user_attributes }

        assert assigns["user"], "Should have a user"
        assert assigns["user"].persisted?, "Should have saved user in the DB"
        assert_equal user_attributes[:name], assigns["user"].name
      end
    end
  end

  context "PATCH :verify" do
    context "when user makes the verify request" do
      context "with a non-matching key" do
        # do nothing (?)
      end
      context "with a matching key"
        # set that user's "verified" boolean to true
    end
  end
end

require 'test_helper'


class UsersControllerTest < ActionController::TestCase


  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  def valid_user_attributes
    { name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password" }
  end

  def invalid_user_attributes
    { name: "",
      email: "",
      password: "",
      password_confirmation: "" }
  end

  context "GET users#new" do
    setup { get :new }

    should respond_with(:ok)
    should render_template(:new)

    should "instantiate a user object" do
      assert assigns[:user], "Should have a user"
    end
  end


  context "GET users#show" do
    setup do 
      get :show, id: users(:chet), format:"json" 
      @user = users(:one)
    end

    should respond_with(:ok)

    should "display json object w/accurate user info" do
      assert_equal "Chet Corey", json_response["name"]
      assert_equal "MyString", json_response["questions"][0]["title"]
      assert_equal "MyText", json_response["questions"][0]["text"]
    end
  end

  context "POST users#create" do
    context "when I send invalid info" do
      setup { post :create, user: invalid_user_attributes }

      should render_template(:new)

      should "instantiate an invalid user object" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].invalid?, "Should have an invalid user"
      end
    end

    context "when I send valid info" do
      setup { post :create, user: valid_user_attributes }

      should "create a user" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].persisted?, "Should have saved user in the DB"
      end

      should "log in" do
        assert_equal assigns[:user].id, session[:current_user_id]
      end

      should "redirect to home" do
        assert_redirected_to root_path
      end
    end
  end
end

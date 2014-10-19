require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  context "GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template(:new)
  end

  context "POST :create" do
    setup do
      @user = User.new(name: Faker::Name.name,
                       email: Faker::Internet.email,
                       password: "password",
                       password_confirmation: "password")
      @user.save
    end

    context "with invalid login info" do
      setup { post :create, {email: @user.email, password: ""} }
      should "re-render the form" do
        assert_redirected_to new_login_path
      end
    end

    context "with valid login info" do
      setup { post :create, {email: @user.email, password: @user.password} }
      should "create a session" do
        assert session[:current_user_id], "Should have a session"
      end
      should "redirect to homepage" do
        assert_redirected_to root_path
      end

      # context "calling current_user" do
      #   should "give ID" do
      #     assert @controller.current_user == @user
      #   end
      # end
    end

  end

  context "DELETE :destroy" do
    setup do
      @user = User.new(name: Faker::Name.name,
                       email: Faker::Internet.email,
                       password: "password",
                       password_confirmation: "password")
      @user.save
      post :create, {email: @user.email, password: @user.password}
    end

    context "on an active session" do
      setup { delete :destroy }
      should "delete the session" do
        refute session[:current_user_id]
      end
      should "and render the login page" do
        assert_redirected_to new_login_path
      end
    end
  end
end

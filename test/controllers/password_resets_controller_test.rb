require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  context "GET password_resets#new" do
    setup do
      get :new
    end

    should render_template("new")
    should respond_with(:ok)
  end

  context "POST password_resets#create" do
    context "with invalid data" do
      setup do
        post :create, email: "digdug"
      end

      should render_template("new")

      should "have an invalid password_reset" do
        assert_invalid_model(:password_reset)
      end
    end

    context "with an email not in our system" do
      setup do
        post :create, email: "digdug@example.org"
      end

      should "take us back to the homepage" do
        assert_redirected_to root_path
      end

      should "have an invalid password_reset" do
        assert_invalid_model(:password_reset)
      end
    end

    context "with an email in our system" do
      setup do
        post :create, email: users(:one).email
      end

      should "take us back to the homepage" do
        assert_redirected_to root_path
      end

      should "have a saved password_reset" do
        assert_saved_model(:password_reset)
      end

      should "send an email" do
        email = ActionMailer::Base.deliveries.last
        assert_not_nil email
        assert_includes email.to, users(:one).email
        assert_equal "Password reset for Question Box", email.subject
      end
    end
  end
end

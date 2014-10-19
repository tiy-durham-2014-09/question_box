require 'test_helper'

class RegisterAndLoginTest < ActionDispatch::IntegrationTest
  context "registration" do
    context "with a valid email and password" do
      setup do
        @email = Faker::Internet.email
        @password = default_password
      end

      should "be able to register as a user" do
        assert_difference "User.count" do
          visit new_user_path
          fill_in "Name", with: Faker::Name.name
          fill_in "Email", with: @email
          fill_in "Password", with: @password
          fill_in "Password confirmation", with: @password
          click_on "Register"
        end

        assert_equal root_path, current_path
        assert page.has_content?("registered")
      end
    end
  end

  context "login" do
    context "with a valid email and password" do
      setup do
        @email = users(:one).email
        @password = default_password
      end

      should "be able to login" do
        visit login_path
        fill_in "Email", with: @email
        fill_in "Password", with: @password
        click_button "Login"

        assert_equal root_path, current_path
        assert page.has_content?("logged in")
      end
    end
  end
end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include BCrypt

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

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
        assert_template :new
      end

      should "instantiate an invalid user object" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].invalid?, "Should have an invalid user"
      end
    end

    context "when I send valid information" do
	    setup do
		    @answer = valid_user_attributes
		    post :create, { user: @answer }
	    end

      should "create a user" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].persisted?, "Should have saved user in the DB"
        assert_equal @answer[:name], assigns["user"].name
      end

      should "create new session" do
	      assert_equal session[:user_id], assigns["user"].id, "Should set session user_id to new user id"
      end

      should "send to homepage after creating user" do
        assert_template :show, "Should send to show"
      end
		end
  end

  context "Verify" do
    context "when I verify with an invalid key" do
      setup do
        @user = users(:one)
        patch :verify, { id: @user.id, key: SecureRandom.uuid }
      end

      should "not verify the user" do
        assert_not @user.reload.verified, "should not verify the user"
      end

      should "send user back to show" do
        assert_template :show, "should send to show"
      end
    end
  end

  context "Verify" do
    context "when I verify with a valid key" do
      setup do
        @user = users(:one)
        patch :verify, { id: @user.id, key: @user.key }
      end

      should "verify the user" do
        assert @user.reload.verified, "should verify the user"
      end

      should "send user to show page" do
        assert_template :show, "should send to show page"
      end
    end
  end
end


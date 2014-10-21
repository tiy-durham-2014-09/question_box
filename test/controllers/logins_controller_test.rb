require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

	context "GET :new" do
		setup { get :new }
		should respond_with(:ok)
		should render_template(:new)

		should set_session(:login)
	end

  context "POST :create" do
	  setup do
			@user = User.new(name: Faker::Name.name,
					             email: Faker::Internet.email,
					             password: "password",
					             password_confirmation: "password")
		  @user.save
	  end

	  context "with invalid password" do
		  setup { post :create, { email: @user.email, password: "" } }

		  should "re-render the form" do
			  assert_template :new
		  end
		end

	  context "with invalid user email" do
		  setup { post :create, { email: "notmyemail@test.com", password: "password" } }

		  should "re-render the form" do
			  assert_template :new
		  end
		end

		context "with valid info" do
			setup { post :create, { email: @user.email, password: "password" } }

			should "redirect to homepage" do
				redirect_to root_path
			end
		end

	end

  context "DELETE :destroy" do
	  setup do
		  @user = User.new(name: Faker::Name.name,
		                   email: Faker::Internet.email,
		                   password: "password",
		                   password_confirmation: "password")
		  @user.save
	  end

	  setup { post :create, { email: @user.email, password: "password" } }

	  should "log out" do
		  setup { session[:current_user_id] = nil }

		  redirect_to :new
	  end
  end


end

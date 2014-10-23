require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  should route(:get, '/login').to(action: 'new')
  should route(:post, '/login').to(action: 'create')
  should route(:delete, '/logout').to(action: 'destroy')

  context "GET :new" do
    setup { get :new}

    should respond_with(:ok)
    should render_template(:new)
  end

  def invalid_login_attributes
    {email: "",
     password: ""}
  end

  context "POST :create" do
    context "when I send invalid information" do
      should "not create session" do
        setup { post :create, { session: invalid_login_attributes } }

        should set_the_flash.now[:error]
        should render_template(:new)
      end
    end

    context "when I send valid information" do
      should "create session and assign a current user" do
        email = user.one[:email]
        post :create, { session: { email: email, password: "password" } }

        login_user = User.where(email: email)


      
      end
    end
  end
end


# def login(user)
#   session[:user_id] = user.id
# end
#
# def current_user
#   @current_user ||= User.find_by(id: session[:user_id])
# end
#
# def logged_in?
#   !current_user.nil?
# end
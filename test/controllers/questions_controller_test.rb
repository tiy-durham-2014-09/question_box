require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  context "GET :index" do
    setup { get :index }
    should respond_with(:ok)
    should render_template(:index)
  end

  context "GET :home" do
    context "While not logged in" do
      setup { get :home }
      should respond_with(:ok)
      should render_template(:home)
      should_not render_template(partial: 'new')
    end
    context "While logged in" do
      setup { get :home, {current_user_id: users(:one).id} }
      should respond_with(:ok)
      should render_template(:home)
      # should render_template(partial: 'new')
    end
  end

  # context "GET :new" do
  #   setup { get :new }
  #   should respond_with(:ok)
  #   should render_template(partial: 'new')
  # end

  context "POST :create" do
    context "When I send invalid info" do
      setup do
        @user = User.new(name: Faker::Name.name,
                         email: Faker::Internet.email,
                         password: "password",
                         password_confirmation: "password")
        @user.save
        post :create, { question: { title: "", text: "", user_id: @user.id } }, { current_user_id: @user.id }
      end
      should "reload home" do
        assert_redirected_to root_path
      end
    end
  end

  context "GET :show" do
    setup { get :show, { id: questions(:one) } }
    should respond_with(:ok)
    should render_template(:show)
  end

end

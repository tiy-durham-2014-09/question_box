require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  context "GET :home" do
    setup { get :home }
    should respond_with(:ok)
    should render_template(:home)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end

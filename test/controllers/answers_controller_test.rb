require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get vote" do
    get :vote
    assert_response :success
  end

end

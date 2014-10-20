require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end



  context 'GET #new' do
    setup { get :new }
    should render_template('new')
    end

  # context "POST :create" do
  #   context "when I send invalid information" do
  #     setup { post :create, { user: invalid_user_attributes } }
  #
  #     should "re-render the form" do
  #       assert_template :new
  #     end
  #   end
  # end

end

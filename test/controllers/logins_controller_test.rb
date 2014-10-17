require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  context "GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template(:new)
  end



end

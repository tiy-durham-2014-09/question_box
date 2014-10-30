require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  context "GET tags#show" do
    setup { get :show, id: tags(:one) }

    should render_template("show")
    should respond_with(:success)

    should "load tags" do
      assert_equal tags(:one), assigns[:tag]
    end

    should "load questions" do
      assert assigns[:questions]
    end
  end

end

require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  context "GET :index" do
    setup { get :index }
    should respond_with(:ok)
    should render_template(:index)
  end

  context "GET :home" do
    setup { get :home }
    should respond_with(:ok)
    should render_template(:home)
  end

  # context "GET :new" do
  #   setup { get :new }
  #   should respond_with(:ok)
  #   should render_template(:new)
  # end

  context "POST :create" do
    # ???
  end

  context "GET show" do
    setup { get :show }
    should respond_with(:ok)
    should render_template(:show)
  end

end

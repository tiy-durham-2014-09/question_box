require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

	context "GET :new" do
		setup { get :new }
		should respond_with(:ok)
		should render_template(:new)
	end

	context "POST :create" do
		setup do
			 get :new
			 @user = users(:one)
		end
		context "when my title is blank" do
			setup { post :create, { question: { title: "",
			                                    text: "Which question should I start with?",
			                                    user_id: @user.id } },
			                      { current_user_id: @user.id } }

			should "re-render the form" do
				assert_template :new
			end
		end



	#
	# 		# should "instantiate an invalid user object" do
	# 		# 	assert assigns["user"], "Should have a user"
	# 		# 	assert assigns["user"].invalid?, "Should have an invalid user"
	# 		# end
	# 	end
	end
end

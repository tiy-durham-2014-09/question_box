require 'test_helper'

# to validate:
#
# t.text     "text"
# t.integer  "user_id"
# t.integer  "question_id"
# t.boolean  "chosen"
# t.integer  "votevalue"


# class AnswersControllerTest < ActionController::TestCase
# 	context "GET :new" do
# 		setup { get :new }
# 		should respond_with(:ok)
# 		should render_template(:new)
# 	end
#
# 	context "POST :create" do
# 		setup do
# 			get :new
# 			@user = users(:one)
# 		end
# 		context "when my title is blank" do
# 			setup { post :create, { question: { title: "",
# 			                                    text: "Tests are so cool.",
# 			                                    user_id: @user.id } },
# 			             { current_user_id: @user.id } }
#
# 			should "re-render the form" do
# 				assert_template :new
# 			end
# 		end
# 		context "when my text box is blank" do
# 			setup { post :create, { question: { title: "Which question should I start with?",
# 			                                    text: "",
# 			                                    user_id: @user.id } },
# 			             { current_user_id: @user.id } }
#
# 			should "re-render the form" do
# 				assert_template :new
# 			end
# 		end
# 	end

	# action
	# response type
	# 	success
	# 	redirect
	# side effects
	# 	creates or updates or deletes
	# updates session
	# 	login
	# 	logout
	# 	(to get ivars out use assigns[])
	# 	(to get sessions use session[])
	# success and error states
	# before and after states

# end

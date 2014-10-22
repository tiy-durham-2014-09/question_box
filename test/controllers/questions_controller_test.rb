require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def invalid_question_attributes
    { question: { title: "",
                  text: "" } }
  end

  def valid_question_attributes
    { question: { title: "How do I?",
                text: "Do this?" } }
  end

  context "GET questions#homepage" do
	  setup { get :homepage }

	  should render_template("homepage")
	  should respond_with(:ok) #difference between "ok" and "success"?

	  should "instantiate a question object" do
		  assert assigns[:question], "should load question"
	  end

	  should "set answered questions" do
		  assert assigns[:recently_answered_questions], "should load recently answered questions"
	  end

	  should "set unanswered questions" do
		  assert assigns[:recently_unanswered_questions], "should load recently unanswered questions"
	  end
  end

  context "GET questions#index" do
    setup { get :index }

    should render_template("index")
    should respond_with(:ok)

		should "instantiate questions object" do
      assert assigns[:questions], "should load questions"
		end
  end

  context "GET questions#show" do
	  setup { get :show, id: questions(:one) }

	  should render_template("show")
	  should respond_with(:ok)

	  should "instantiate question object" do
		  assert assigns[:question], "should load questions"
	  end

	  should "instantiate load answers" do
		  assert assigns[:answers], "should load questions"
	  end
  end

  context "GET questions#new" do
    context "when user is not logged in" do
      setup { get :new }

      should "redirect to login page" do
        assert_redirected_to new_login_path
      end
    end

    context "when logged in" do
      setup do
        get :new, {}, logged_in_session
      end

      should "instantiate a new question object" do
        assert assigns[:question], "Should have a new question"
      end
    end
  end

  context "POST#create" do
    context "when user is not logged in" do
      setup { post :create }

      should "redirect to homepage" do
        assert_redirected_to new_login_path
      end
    end

    context "when I send invalid information" do
      setup do
        post :create, invalid_question_attributes, logged_in_session
      end

      should "re-render the form" do
        assert_template :new
      end

      should "instantiate an invalid question object" do
        assert assigns["question"], "Should have a question"
        assert assigns["question"].invalid?, "Should have an invalid question"
      end
    end

    context "when I send valid information" do
      setup do
        post :create, valid_question_attributes, logged_in_session
      end

      should "create a question" do
        assert assigns["question"], "Should have a question"
        assert assigns["question"].persisted?, "Should have saved question in the DB"
      end

      should "show question" do
        assert_redirected_to question_path(assigns["question"]), "Should redirect to show question"
      end
    end

  end

  context "POST :VOTE" do
		context "when user is not logged in" do
			setup { post :vote, { id: questions(:two) } }

	    should "redirect to homepage" do
			  assert_redirected_to new_login_path
		  end
		end

	  context "when user is logged in" do
		  context "sends invalid information" do
			  setup do
				  post :vote, { id: questions(:two), vote: { value: 0 } }, logged_in_session
			  end

		    should "instantiate invalid vote object" do
			    assert assigns["vote"], "should have a vote object"
			    assert assigns["vote"].invalid?, "should be an invalid vote"
		    end

				should "redirect to question" do
				  assert_redirected_to questions(:two), "should send to question"
				end
	    end

			context "sends valid information" do
				setup do
					post :vote, { id: questions(:two), vote: { value: 1 } }, logged_in_session
				end

				should "instantiate valid vote object" do
					assert assigns[:vote], "should have a vote object"
					assert assigns[:vote].persisted?, "should be saved to db"
				end

				should "redirect to question" do
					assert_redirected_to questions(:two), "should send to question"
				end
			end
	  end

	end

  context "DELETE" do
    context "when I delete a question" do
      should "user should be removed from database" do
        assert_raise ActiveRecord::RecordNotFound do
          question_id = questions(:one).id
          delete :destroy, { id: question_id }, logged_in_session
          Question.find(question_id)
        end
      end

      should "send to homepage" do
        delete :destroy, { id: questions(:one).id }, logged_in_session
        assert_redirected_to root_path, "should send to homepage"
      end
    end
  end

end
require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def valid_question_data
    { question: { title: "How do I #{Faker::Hacker.verb} #{Faker::Hacker.noun}?",
    text:  Faker::Lorem.paragraph } }
  end

  def invalid_question_data
    { question: { title: "",
      text:  "" } }
    end
    def json_response
      ActiveSupport::JSON.decode @response.body
    end

    def json_response
      ActiveSupport::JSON.decode @response.body
    end

    context "GET questions#home" do
      setup { get :home }

      should render_template("home")
      should respond_with(:success)

      should "instantiate a question object" do
        assert assigns[:question], "Should have a question"
      end

      should "load unanswered questions" do
        assert assigns[:unanswered_questions], "Should load unanswered questions"
      end

      should "load recently answered questions" do
        assert assigns[:answered_questions], "Should load recently answered questions"
      end
    end

    context "GET questions#index" do
      setup { get :index, { format: "html" } }
      context "as html" do
        setup { get :index }

        should render_template("index")
        should respond_with(:success)

        should "load questions" do
          assert assigns[:questions], "Should load questions"
        end
      end
      context "as json" do
        setup { get :index, format: "json"}

        should respond_with(:ok)
        should "serve json object with correct content" do
          assert_equal "MyString", json_response["questions"][0]["title"]
          assert_equal "MyText", json_response["questions"][0]["text"]


          assert_equal "Chet Corey", json_response["questions"][0]["user"]["name"]
          assert_equal "chet@example.org", json_response["questions"][0]["user"]["email"]
          assert_equal 1000, json_response["questions"][0]["user"]["score"]

          assert_equal "MyText", json_response["questions"][0]["answers"][1]["text"]
          assert_equal false, json_response["questions"][0]["answers"][1]["chosen"]


        end
      end
    end

    context "GET questions#show" do
      context "as html" do
        setup { get :show, id: questions(:one), format: "html"}

        should render_template("show")
        should respond_with(:success)

        should "load question" do
          assert_equal questions(:one), assigns[:question]
        end

        should "instantiate answer" do
          assert assigns[:answer], "Should have a blank answer"
        end
      end

      context "as json" do
        setup { get :show, id: questions(:one), format: "json"}

        should respond_with(:success)
        should "serve json object with correct content" do
          assert_equal "MyString", json_response['title']
          assert_equal "Chet Corey", json_response['user_name']
          assert_equal "User Two", json_response['answers'][0]['user']
        end
      end
    end

    context "GET questions#new" do
      context "when not logged in" do
        setup { get :new }

        should "redirect to login" do
          assert_redirected_to login_path
        end
      end

      context "when logged in" do
        setup do
          get :new, {}, logged_in_session
        end

        should render_template("new")
        should respond_with(:success)

        should "instantiate a question object" do
          assert assigns[:question], "Should have a question"
        end
      end
    end

    context "POST questions#create" do
      context "when not logged in" do
        setup { post :create }

        should "redirect to login" do
          assert_redirected_to login_path
        end
      end

      context "when logged in" do
        context "with invalid data" do
          setup do
            post :create, invalid_question_data, logged_in_session
          end

          should render_template(:new)

          should "instantiate an invalid question object" do
            assert_invalid_model(:question)
          end
        end

        context "with valid data" do
          setup do
            post :create, valid_question_data, logged_in_session
          end

          should "create a question" do
            assert_saved_model(:question)
          end

          should "redirect to question" do
            assert_redirected_to question_path(assigns[:question])
          end
        end
      end
    end

    context "POST questions#vote" do
      context "when not logged in" do
        setup { post :vote, id: questions(:one) }

        should "redirect to login" do
          assert_redirected_to login_path
        end
      end

      context "when logged in" do
        context "with invalid data" do
          setup do
            post :vote, { id: questions(:one), value: 0 }, logged_in_session
          end

          should "instantiate an invalid vote object" do
            assert_invalid_model(:vote)
          end

          should "redirect to question" do
            assert_redirected_to question_path(assigns[:question])
          end
        end

        context "with valid data" do
          setup do
            post :vote, { id: questions(:one), value: 1 }, logged_in_session
          end

          should "create a vote" do
            assert_saved_model(:vote)
          end

          should "redirect to question" do
            assert_redirected_to question_path(assigns[:question])
          end
        end
      end
    end
  end

require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  def invalid_vote_attributes
    question_id = questions(:one).id
    {text: "",
     vote_count: "",
     user_id: "",
     voteable_id: question_id,
     voteable_type: "ques"}
  end

  def valid_upvote_attributes
    { vote: { up: true,
              voteable_id: questions(:one).id,
              voteable_type: "Question"} }
  end

  def valid_downvote_attributes
    { vote: { up: false,
              voteable_id: questions(:one).id,
              voteable_type: "Question"} }
  end

  def get_voteable(model_id,model_type)

    if model_type == "Question"
      @voteable = Question.find(model_id)
    elsif model_type == "Answer"
      @voteable = Answer.find(model_id)
    end

  end

  context "POST :create" do
    context "when I send invalid information" do
      setup do
        @request.env['HTTP_REFERER'] = question_url(questions(:one))
        voteable_id = questions(:one).id
        session[:user_id] = users(:voter).id
        post :create, { :voteable_id => voteable_id, vote: invalid_vote_attributes }, logged_in_session
      end

    end

  end

end

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

  def valid_vote_attributes
    vote_attributes = votes(:one_for_question).attributes
    vote_attributes["voteable_id"] = questions(:one).id.to_i
    vote_attributes
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
        post :create, { :voteable_id => voteable_id, vote: invalid_vote_attributes }
      end

    end

    context "when I send valid information" do
      setup do
        @voteable_id = questions(:one).id
        @voteable_type = "Question"
        @voter_id = users(:voter).id
        session[:user_id] = @voter_id
        @vote_attributes = valid_vote_attributes

      end

      context "when I up vote" do
        setup do
          @request.env['HTTP_REFERER'] = question_url(questions(:one))
          @vote_attributes["value"] = 1
          post :create, { :voteable_id => @voteable_id, vote: @vote_attributes }
        end

        should "create an up vote" do
          assert assigns["vote"], "Should have a vote"
          assert assigns["vote"].persisted?, "Should have saved vote in the DB"
          assert_equal 1, assigns["vote"].value, "Should have value"
          assert_equal @voter_id, assigns["vote"].user_id, "Should have a user id"
          assert_equal @voteable_id, assigns["vote"].voteable_id, "Should have a voteable id"
          assert_equal @voteable_type, assigns["vote"].voteable_type, "Should have a voteable type"
        end
      end

      context "when I down vote" do
        setup do
          @request.env['HTTP_REFERER'] = question_url(questions(:one))
          @vote_attributes["value"] = -1
          post :create, { :voteable_id => @voteable_id, vote: @vote_attributes }
        end

        should "create a down vote" do
          assert assigns["vote"], "Should have a vote"
          assert assigns["vote"].persisted?, "Should have saved vote in the DB"
          assert_equal -1, assigns["vote"].value, "Should have value"
          assert_equal @voter_id, assigns["vote"].user_id, "Should have a user id"
          assert_equal @voteable_id, assigns["vote"].voteable_id, "Should have a voteable id"
          assert_equal @voteable_type, assigns["vote"].voteable_type, "Should have a voteable type"
        end

        should "show redirect back to question path" do
          post :create, { :voteable_id => @voteable_id, vote: @vote_attributes }
          assert_redirected_to :back, "Should redirect to show question"
        end
      end
    end

  end

    # context "DELETE" do
    #   context "when I delete a vote" do
    #     setup do
    #       @vote = votes(:one_for_question)
    #       @vote_id = @vote.id
    #       @voteable_id = questions(:one).id
    #       @voteable = @vote.get_question(@voteable_id)
    #     end
    #
    #     should "vote should be removed from database" do
    #       assert_raise ActiveRecord::RecordNotFound do
    #         delete :destroy, { voteable_id: @voteable_id, id: @vote_id }
    #         Vote.find(@vote_id)
    #       end
    #     end
    #
    #     should "update voteable vote count" do
    #       original_count = @voteable.vote_count
    #
    #       assert_difference 'original_count', @voteable.vote_count, -1 do
    #         delete :destroy, { voteable_id: @voteable_id, id: @vote_id }
    #       end
    #     end
    #
    #     should "send to question show" do
    #       delete :destroy, { voteable_id: @voteable_id, id: @vote_id }
    #       assert_redirected_to question_path(@voteable_id), "should send to question show page"
    #     end
    #   end
    # end

end

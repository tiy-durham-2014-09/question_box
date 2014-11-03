class AnswersController < ApplicationController
  before_action :authenticate

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers.order_by_votes
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    respond_to do |format|
      format.html do
        if @answer.save
          redirect_to @question
        else
          render "questions/show"
        end
      end

      format.js do
        if @answer.save
          render :create, status: :created
        else
          render nothing: true, status: :bad_request
        end
      end
    end

    #need to store key in env variables. put them in .env file but not working

    # if @question.sms == true
    # res=HTTParty.post("https://api.sendhub.com/v1/messages/?#{ENV["SENDHUB_NUMBER"]}&api_key=#{ENV["SENDHUB_KEY"]}", body: { "contacts" => [@question.user.contact], "text" => "You have a new answer to your question '#{@question.title}' : '#{@answer.text.truncate(25)}'"}.to_json, headers: {"Content-Type" => "application/json"})


    # end

    #unsuccessful attempt to get VCR working
    # context "POST :post" do
    #   setup do
    #     @question = :one
    #     @question.sms = true
    #     VCR.use_cassette("sendhub") do
    #       post :post, :query => "test"
    #     end
    #   end
    #
    #   should respond_with(:ok)
    #
    #   should "return JSON" do
    #     assert_includes response.header['Content-Type'], 'application/json'
    #   end
    # end
  end

  def vote
    @voteable = Answer.find(params[:id])
    @vote = @voteable.votes.build(user: current_user, value: params[:value])
    respond_to do |format|
      format.html do
        if @vote.save
          redirect_to @voteable.question, success: "Your vote was recorded."
        else
          redirect_to @voteable.question, error: "There was a problem saving your vote."
        end
      end
      format.js do
        if @vote.save
          render "votes/create", status: :created
        else
          render "votes/create", status: :accepted
        end
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end

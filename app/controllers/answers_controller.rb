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
    res=HTTParty.post("https://api.sendhub.com/v1/messages/?username=9194486757&api_key=4639f9b62be4b60ce70dfb54d30c11214f86f8e9", body: { "contacts" => [@question.user.contact], "text" => "You have a new answer to your question"}.to_json, headers: {"Content-Type" => "application/json"})
    # res=HTTParty.post("https://api.sendhub.com/v1/messages/?#{ENV["SENDHUB_NUMBER"]}&api_key=#{ENV["SENDHUB_KEY"]}", body: { "contacts" => [@question.user.contact], "text" => "You've got answers"}.to_json, headers: {"Content-Type" => "application/json"})
    #need to store key in env variables. put them in .env file but not working
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

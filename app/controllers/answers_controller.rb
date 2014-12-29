class AnswersController < ApplicationController
  before_action :authenticate
<<<<<<< HEAD
  
  def new
    @answers = Answer.new
  end 
 
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user    
    if @answer.save
      redirect_to @question
    else
      render 'questions/show'
    end
  end
  
  def vote
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.build(user: current_user, value: params[:vote][:value])
    if @vote.save
      redirect_to @answer.question, success: "Your vote was recorded."
    else
      redirect_to @answer.question, error: "There was a problem saving your vote."
=======

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
>>>>>>> 66bf726a78e18dafded69c8dc07dc8b10c383a19
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end

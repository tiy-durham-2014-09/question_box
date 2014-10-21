class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @user_id = User.find(params[:id])

    if @answer.save
      flash.now[:notice] = "Answered!"
    else
      flash.now[:notice] = "Your answer is invalid."
    end
    redirect_to @question
  end

  def vote
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.build(user: current_user, value: params[:value])
    if @vote.save
      flash.now[:notice] = "You're vote has been cast."
      redirect_to question_path(@question)
    else
      flash.now[:notice] = "Something went wrong with your vote."
      redirect_to root_path
    end

  end


  private

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

end

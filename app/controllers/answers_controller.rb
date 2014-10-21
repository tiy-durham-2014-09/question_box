class AnswersController < ApplicationController
   def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end
  def vote
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.build(user: current_user, value: params[:vote][:value])
    if @vote.save
      redirect_to @answer.question
    else
      redirect_to @answer.question
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:text)
    end
end

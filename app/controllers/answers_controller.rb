class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
   # @answer.user = current_user

    if @answer.save
      flash.now[:success] = "Answered!"
      redirect_to @question
    else
      flash.now[:error] = "Your answer is invalid."
      redirect_to @question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

end

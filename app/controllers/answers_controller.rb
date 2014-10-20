class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      flash.now[:success] = "Answered!"
      redirect_to question_path
    else
      flash.now[:error] = "Your answer is invalid."
      redirect_to question_path
    end
  end

  private

  def answer_params
    require(:answer).permit(:text, :user_id, :question_id)
  end

end

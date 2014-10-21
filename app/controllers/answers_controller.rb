class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      redirect_to question_path(@answer.question.id), notice: "Invalid answer input."
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end
end

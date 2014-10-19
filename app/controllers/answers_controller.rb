class AnswersController < ApplicationController
  def new

  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      redirect_to :back
    end
  end

  def destroy
    answer = Answer.find(params["id"])
    question = answer.question
    answer.destroy
    redirect_to question_path(question)
  end

  def answer_params
    params.require(:answer).permit(:text, :vote_count, :user_id, :question_id, :chosen)
  end

end

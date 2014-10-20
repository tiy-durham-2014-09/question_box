class AnswersController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    @answers = @question.answers.all
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      flash.now[:success] = "Answered!"
    else
      flash.now[:error] = "Your answer is invalid."
    end
  end

  private

  def answer_params
    require(:answer).permit(:text, :user_id, :question_id)
  end

end

class AnswersController < ApplicationController
  before_action :authenticate

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  def destroy
    answer = Answer.find(params["id"])
    question = answer.question
    if answer.destroy
      redirect_to question_path(question)
    end
  end

  def update
    answer = Answer.find(params["id"])
    # answer.update(answer_params)
    answer.toggle(:chosen)
    answer.save
    redirect_to question_path(answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end

end

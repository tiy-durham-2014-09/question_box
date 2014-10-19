class AnswersController < ApplicationController
  # before_action :set_question

  def new
    # @question = Question.find(params["answer"]["question_id"])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to :back
    end
  end

  def destroy
    answer = Answer.find(params["id"])
    question = answer.question
    if answer.destroy
      redirect_to question_path(question)
    end
  end

  private

  # def set_question
  #   @question = Question.find(params[:id])
  # end

  def answer_params
    params.require(:answer).permit(:text)
  end

end

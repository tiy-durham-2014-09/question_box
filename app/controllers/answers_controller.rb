class AnswersController < ApplicationController
  before_action :authenticate

  def new

  end

  def create
    @question = Question.find_by(id: params[:question_id])
    question_id = @question.id
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to show_questions_path(question_id)
    else
      redirect_to show_questions_path(question_id)
    end
  end

  def show

  end

  def choose
    answer = Answer.find_by(id: params[:answer_id])
    answer.question.answers.update_all(chosen: false)
    answer.update(chosen: true)
    redirect_to :back
  end

  def vote
    value = params[:value]
    user = User.find_by(id: params[:user])
    answer = Answer.find_by(id: params[:answer_id])
    answer.votes.create!(:value => value, :user => user)
    redirect_to :back
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :text, :user, :value, :user_id, :question_id)
  end

end

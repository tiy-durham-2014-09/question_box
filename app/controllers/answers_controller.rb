class AnswersController < ApplicationController
  before_action :authenticate

  def new

  end

  def create
    @answer = current_user.answers.build(answer_params)
    question_id = params[:question_id]
    respond_to do |format|
      if @answer.save
        format.html { redirect_to show_questions_path(question_id), notice: 'answer was successfully created.' }
      else
        format.html { redirect_to show_questions_path(question_id), notice: 'answer was NOT successfully created.'  }
      end
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

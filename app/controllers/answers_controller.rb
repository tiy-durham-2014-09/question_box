class AnswersController < ApplicationController
  before_action :authenticate

  def new

  end

  def create
    @answer = current_user.answers.build(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to :back, notice: 'answer was successfully created.' }
      else
        format.html { redirect_to :back, notice: 'answer was NOT successfully created.'  }
      end
    end
  end

  def show

  end


  private

  def answer_params
    params.require(:answer).permit(:title, :text, :user_id, :question_id)
  end

end

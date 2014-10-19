class AnswersController < ApplicationController
  def show
  end

  def create
    if current_user
      @answer = Answer.new(answer_params)
    end
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: 'Answer was successfully  posted.' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def delete
  end

  private

  def answer_params
    params.permit(:text, :user_id, :question_id, :chosen)
  end
end

class QuestionsController < ApplicationController
  def new

  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question.id)
    else
      render :new
    end
  end

  def destroy
    Question.find(params["id"]).destroy
    redirect_to root_path
  end

  def question_params
    params.require(:question).permit(:title, :text, :vote_count, :user_id)
  end
end
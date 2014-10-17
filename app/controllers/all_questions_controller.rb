class AllQuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at")
  end



  private

  def all_questions_params
    params.require(:questions).permit(:title, :text, :user)
  end
end

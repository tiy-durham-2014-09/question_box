class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path(@question.id)
    else
      flash.now[:error] = "Invalid"
      redirect_to home_questions_url
    end
  end

  def home
    @question = Question.new
  end

  def new
  end

  private

  def question_params
    params.require(:question).permit(:title, :text, :user_id)
  end
end

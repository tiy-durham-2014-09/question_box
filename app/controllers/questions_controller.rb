class QuestionsController < ApplicationController
  before_action :authenticate, only: [:new, :create]

  def home
    @question = Question.new
    @recent_questions = Question.order(created_at: :desc).limit(5)
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.build
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end
end

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show ]

  def index
    @questions = Question.all
  end

  def home
    @question = Question.new
    @questions = Question.all

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      redirect_to root_path, notice: "Invalid question input."
    end
  end

  def show
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :text, :user_id)
  end
end

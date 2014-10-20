class QuestionsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy]
  before_action :set_question, only: [:show, :edit, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @answers = @question.answers
    # @answer = Answer.new
    # @question = Question.find(params[:id])
  end

  def homepage
    index
    new
  end

  def create
    @question = current_user.questions.create(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :text, :vote_count, :user_id)
  end
end
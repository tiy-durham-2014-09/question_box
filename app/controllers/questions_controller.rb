class QuestionsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :destroy]
  before_action :set_question, only: [:show, :edit, :destroy, :vote]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
	  @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def homepage
    @question = Question.new
    @recently_answered_questions = Question.includes(:answers).order('answers.created_at DESC').where.not( :answers => { :question_id => nil } )[0,5]
    @recently_unanswered_questions = Question.includes(:answers).where( :answers => { :question_id => nil } ).order(created_at: :desc).limit(5)
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
    params.require(:question).permit(:title, :text)
  end
end
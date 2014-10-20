class QuestionController < ApplicationController
before_action :set_question, only: [:show, :edit, :update, :destroy]
before_action :authenticate


  def index
    @question = Question.paginate(page: params[:page], per_page: 10)
    @questions = Question.new
    @answer = Answer.new
  end
  
  def new
    @question = Question.new
  end
  
	def home
		@question = Question.new
		@recent_questions = Question.order(created_at :desc).limit(10)
	end

  def create
    @question = current_user.questions.build(question_params)
      if @question.save
      	redirect_to @question
      else
        render :new
      end
  end

  def update
  end

  def destroy
  end
  def show
    @question = Question.find(params[:id])
  end
  private

  def set_question
    @question = Question.find(params[:id])
  end
  def question_params
    params.require(:question).permit(:title, :text)  
  end
end

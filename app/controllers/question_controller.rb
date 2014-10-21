class QuestionController < ApplicationController
before_action :set_question, only: [:show, :vote]
before_action :authenticate, only: [:new, :create, :vote]


  def index
    @question = Question.paginate(page: params[:page], per_page: 10)
    @questions = Question.new
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
    @answers = @question.answers
  end


  def vote
    @vote = @question.votes.build(user: current_user, value: params[:vote][:value])
    if @vote.save
      redirect_to @question, success: "Your vote was recorded."
    else
      redirect_to @question, error: "There was a problem saving your vote."
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :text)  
  end
end

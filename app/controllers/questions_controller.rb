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
      flash.now[:notice] = "Invalid"
      redirect_to home_questions_url
    end
  end

  def home
    @question = Question.new
  end

  def vote
    @question = Question.find(params[:id])
    @vote = @question.votes.build(user: current_user, value: params[:value])
    if @vote.save
      flash.now[:notice] = "You're vote has been cast."
    else
      flash.now[:notice] = "Something went wrong with your vote."
    end
    redirect_to @question
  end



  private

  def question_params
    params.require(:question).permit(:title, :text, :user_id)
  end
end

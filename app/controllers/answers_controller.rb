class AnswersController < ApplicationController
  before_action :authenticate
  before_action :set_answer, only: [:destroy, :update, :vote]

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  def destroy
    if @answer.destroy
      redirect_to @answer.question
    end
  end

  def update
    @answer.toggle(:chosen)
    @answer.save
    redirect_to @answer.question
  end

	def vote
		@vote = @answer.votes.build(user: current_user, value: params[:vote][:value])
		if @vote.save
			redirect_to @answer.question
		else
			redirect_to @answer.question
		end
	end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end

	def set_answer
		@answer = Answer.find(params["id"])
	end

end

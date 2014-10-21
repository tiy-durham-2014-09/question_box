class QuestionsController < ApplicationController
	before_action :authenticate, only: [:new, :create, :vote]
	before_action :set_question, only: [:show, :vote]

	def index
		@questions = Question.all.reverse_order.page params[:page]
	end

	def new
		@question = Question.new
	end

	def create
		@question = current_user.questions.build(question_params)
		if @question.save
			redirect_to "show"
		else
			render "new"
		end
	end

	def home
		@question = Question.new
		@questions = Question.all.reverse_order.limit(5)
	end

	def show
		@answer = @question.answers.build
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

	def question_params
		params.require(:question).permit(:title, :text, :user_id, :votevalue)
	end

	def set_question
		@question = Question.find(params[:id])
	end

end

class QuestionsController < ApplicationController
	# before_action :authenticate
	# before_action :set_question, only: [:show, :edit, :update, :destroy]
	# after_filter :set_previous_url, only: [:new]

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)

		if @question.save
			redirect_to "show"
		else
			render "new"
		end
	end

	def home
		@questions = Question.all
	end


	private

	def question_params
		params.require(:question).permit(:title, :text, :user_id, :votevalue)
	end

end

class QuestionsController < ApplicationController
			before_action :authenticate
		before_action :set_question, only: [:show, :edit, :update, :destroy]
		# before_action :ensure_user_owns_post


		def index
			@questions = Question.all
			@questions1 = current_user.questions
		end

		def show
			@question = Question.find(params[:id])
		end

		def new
			@question = Question.new
		end

		def edit
		end

		def create
			@question = Question.new(question_params)
			@question.user = current_user

			respond_to do |format|
				if @question.save
					format.html { redirect_to @question, notice: 'Question was successfully created.' }
					format.json { render :show, status: :created, location: @question }
				else
					format.html { render :new }
					format.json { render json: @question.errors, status: :unprocessable_entity }
				end
			end
		end

		def update
			respond_to do |format|
				if @question.update(question_params)
					format.html { redirect_to @question, notice: 'Question was successfully updated.' }
					format.json { render :show, status: :ok, location: @question }
				else
					format.html { render :edit }
					format.json { render json: @question.errors, status: :unprocessable_entity }
				end
			end
		end

		def destroy
			@question.destroy
			respond_to do |format|
				format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
				format.json { head :no_content }
			end
		end

		private
			def set_question
				@question = Question.find(params[:id])
			end

			def question_params
			params.require(:question).permit(:title, :text, :user_id, :question_id)
			end
end

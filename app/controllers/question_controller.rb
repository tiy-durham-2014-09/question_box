class QuestionController < ApplicationController
before_action :set_question, only: [:show, :edit, :update, :destroy]
before_action :authenticate

  def index
    @question = Question.all
  end
  def new
    @question = Question.new
  end


  def create
    if current_user
      @question = Question.new(question_params)
    end
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
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
    params.require(:question).permit(:title, :text, :user_id)
  end
end

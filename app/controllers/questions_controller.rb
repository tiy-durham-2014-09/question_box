class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    render 'new'
  end

  def destroy
  end
end

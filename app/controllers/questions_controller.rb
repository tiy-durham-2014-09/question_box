class QuestionsController < ApplicationController
  before_action :authenticate

  def new

  end

  def create
    @question = current_user.questions.build(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def index
  end

  def show

  end

  private

  def question_params
    params.require(:question).permit(:title, :text, :user_id, :questions_tags)
  end

end

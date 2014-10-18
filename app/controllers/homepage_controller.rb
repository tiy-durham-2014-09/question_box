class HomepageController < ApplicationController
    # before_action :authenticate

  def create
     @question = Question.new(question_param)
    if @question.save!
      redirect_to users_new_path, notice: "congrats"
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      redirect_to homepage_index_path, notice: "woops"
    end
  end

  def index
    @homepage = Question.all
  end

  private


end

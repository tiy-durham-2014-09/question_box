class VotesController < ApplicationController
  before_action :authenticate, only: [:new, :create, :destroy]
  before_action :set_vote

  def new
  end

  def create
    @value = set_value

    if @voteable && !check_double_vote
      @vote = Vote.create(voteable_id: @voteable_id, voteable_type: @voteable_type, value: @value, user_id: current_user.id)
      @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    vote = Vote.find(params["id"])
    question = vote.get_question(params["voteable_id"])
    if vote.destroy
      redirect_to question_path(question)
    end
  end

  def vote_params
    params.require(:vote).permit(:up, :voteable_type, :voteable_id)
  end

  private

  def set_vote
    model_type = vote_params["voteable_type"]
    model_id = vote_params["voteable_id"]

    if model_type == "Question"
      @voteable = Question.find(model_id)
    elsif model_type == "Answer"
      @voteable = Answer.find(model_id)
    end

    @voteable_id = model_id.to_i
    @voteable_type = model_type

  end

  def check_double_vote
    existing_vote = Vote.find_by(user_id: vote_params["user_id"], voteable_type: vote_params["voteable_type"], voteable_id: vote_params["voteable_id"])
  end

  def set_value
    if vote_params[:up] == "true"
      1
    elsif vote_params[:up] == "false"
      -1
    end
  end
end

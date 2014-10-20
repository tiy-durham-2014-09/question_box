class VotesController < ApplicationController
  def new
  end

  def create
    @voteable = get_voteable(vote_params["voteable_id"],vote_params["voteable_type"])

    if @voteable &&
      @vote = @voteable.votes.create(vote_params)
      @vote.user_id = current_user.id

      @vote.save

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

  def update
    existing_vote = Vote.find_by(user_id: vote_params["user_id"], voteable_type: vote_params["voteable_type"], voteable_id: vote_params["voteable_id")
    existing_vote.update(vote_params)
  end

  def vote_params
    params.require(:vote).permit(:value, :voteable_type, :voteable_id, :user_id)
  end

  private

  # Need test?
  def get_voteable(model_id,model_type)

    if model_type == "Question"
      @voteable = Question.find(model_id)
    elsif model_type == "Answer"
      @voteable = Answer.find(model_id)
    end

  end

  def check_double_vote
    existing_vote = Vote.find_by(user_id: vote_params["user_id"], voteable_type: vote_params["voteable_type"], voteable_id: vote_params["voteable_id")

    if existing_vote
      update
    end
  end
end

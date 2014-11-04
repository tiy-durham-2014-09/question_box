require 'classifier-reborn'

class QuestionsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :vote]
  before_action :set_question, only: [:show, :vote]

  def home
    @question = Question.new
    @unanswered_questions = Question.unanswered.order(created_at: :desc).limit(5)
    @answered_questions = Question.recently_answered.limit(5)
  end

  def index
    @questions = Question.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question, success: "Your question has been created."
    else
      render :new
    end
  end

  def show
    @answers = @question.answers.order_by_votes
    @answer = Answer.new
  end

  def vote
    @voteable = @question
    @vote = @voteable.votes.build(user: current_user, value: params[:value])
    respond_to do |format|
      format.html do
        if @vote.save
          redirect_to @question, success: "Your vote was recorded."
        else
          redirect_to @question, error: "There was a problem saving your vote."
        end
      end
      format.js do
        if @vote.save
          render "votes/create", status: :created
        else
          render "votes/create", status: :accepted
        end
      end
    end
  end

  def related
	  @question = Question.find(params[:id])
	  questions = Question.all
	  lsi = ClassifierReborn::LSI.new
	  joined_questions_hash = Hash.new

	  questions.each do |question|
		  joined_question_text = question.title + " " + question.text
		  lsi.add_item(joined_question_text)
		  joined_questions_hash[question.id] = joined_question_text
	  end

	  @related_questions = Array.new

	  search_text = @question.title + " " + @question.text

	  lsi.find_related(search_text,4).each do |question_text|
		  key = joined_questions_hash.key(question_text)
		  if key != @question.id
		    @related_questions << Question.find(key)
			end
	  end

		@related_questions = @related_questions.take(3)
  end

  private

  def set_question
    @question = Question.friendly.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :text, :tag_list)
  end
end

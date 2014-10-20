class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  has_many :comments, as: :commentable

  has_and_belongs_to_many :tags
  has_many :votes, as: :voteable


  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  validates :votevalue, presence: true

  before_save :default_vote_count

  def default_vote_count
	  self.votes ||= 0
  end

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def score
    votes.sum(:value)
  end

  def upvote
	  self.votes += 1
  end

end

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true
  validates :comments, presence: true
  validates :votes, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  # def up_vote
  #   question.votes.where(value: 10).count
  # end
  #
  # def down_vote
  #   question.votes.where(value: -5).count
  # end
  #
  # def give_down_vote
  #   self.votes.where(value: -1).count
  # end
  #
  # def points
  #   question.votes.sum(:value).to_i
  # end
  #
  # def receive_upvote_points
  #   if up_vote
  #     question.value += 10
  #     question.save
  #   end
  # end


end

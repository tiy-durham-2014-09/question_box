class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_and_belongs_to_many :tag

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def score
    score = 0
    votes.each do |v|
      score += v.value
    end
  end
end

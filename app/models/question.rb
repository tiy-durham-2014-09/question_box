class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  has_many :answers
  has_many :tags
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true
  validates :tag, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def total_score
    score = 0
    self.votes.each do |vote|
      if vote.value == 1
        score += 1
      else
        score -= 1
      end
    end
    score
  end

end

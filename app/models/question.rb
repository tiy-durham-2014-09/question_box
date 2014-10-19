class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_and_belongs_to_many :tags
  has_many :votes, as: :voteable
  default_scope -> { order('created_at DESC') }
  self.per_page = 10

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def score
    votes.sum(:value)
  end

end

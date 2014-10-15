class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag #FIX THIS LATER
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable #FIX THIS LATER
  has_and_belongs_to_many :tags #FIX THIS LATER

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def score_total
    #ADD STUFF HERE
  end
end

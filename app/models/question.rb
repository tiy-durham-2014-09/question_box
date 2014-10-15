class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  has_many :comments, as: :commentable

end

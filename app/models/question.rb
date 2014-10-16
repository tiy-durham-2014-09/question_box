class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  #	has many comments (polymorphic association)

  #	has many votes (polymorphic association)

  #	knows its total score (determined by votes)

  #	has and belongs to many tags (tags being short phrases that show the topics of the question)

end

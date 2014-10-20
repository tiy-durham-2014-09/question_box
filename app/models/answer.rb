class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable

  validates :text, presence: true
  validates :user, presence: true
  validates :question, presence: true

  validate :check_one_chosen_answer_per_question

  after_save :award_user_points

  def check_one_chosen_answer_per_question
    return unless question.present?

    if question.has_chosen_answer? && self.chosen?
      errors.add(:chosen, "cannot be chosen because there is already a chosen answer for that question")
    end
  end

  def award_user_points
    if chosen_changed?(to: true)
      user.score += 100
      user.save
    end
  end

  def score
    votes.sum(:value)
  end

end

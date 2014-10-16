class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

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

  # def up_vote
  #   self.votes.where(value: 10).count
  # end
  #
  # def down_vote
  #   self.votes.where(value: -5).count
  # end
  #
  # def give_down_vote
  #   self.votes.where(value: -1).count
  # end
  #
  # def points
  #   self.votes.sum(:value).to_i
  # end

  def award_user_points
    if chosen_changed?(to: true)
      user.score += 100
      user.save
    end

    # if up_vote
    #   user.score += 10
    #   user.save
    # end
    #
    # if down_vote
    #   user.score -= 5
    #   user.save
    # end
  end


end

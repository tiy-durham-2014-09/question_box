class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value,
            presence: true,
            inclusion: { in: [1, -1], message: "Vote must be 1 or -1" }
  validates :user, presence: true
  validates_uniqueness_of :user, scope: :voteable

  validate :check_against_self_voting
  # validate :check_against_double_vote

  after_save :adjust_points, :adjust_vote_count

  def check_against_self_voting
    return unless voteable.respond_to?(:user) && voteable.user

    if voteable.user == user
      errors.add(:user, "cannot vote on their own content")
    end
  end

  ## need test
  # def check_against_double_vote
  #   existing_vote = Vote.find_by(user_id: user_id, voteable_type: voteable_type, voteable_id: voteable_id)
  #   return unless existing_vote
  #
  #   if existing_vote
  #     errors.add(:user, "cannot vote twice")
  #   end
  # end

  def adjust_points
    if value > 0
      voteable.user.increment!(:score, 10)
    elsif value < 0
      if voteable.user.score >= 5
        voteable.user.decrement!(:score, 5)
      else
        voteable.user.update_attribute(:score, 0)
      end

      user.decrement!(:score)
    end

    voteable.user.save
  end

  #Need test
  def adjust_vote_count
    values = Vote.where(voteable_id: voteable_id, voteable_type: voteable_type).pluck(value)
    voteable.vote_count = values.reduce(:+)
    voteable.save
  end

  # Need test
  def get_question(voteable_id)
    @voteable = Question.find(voteable_id)
  end

end

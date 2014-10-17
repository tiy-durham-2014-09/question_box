class Vote < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true

  after_create :award_user_points
  after_create :adjust_vote_count

  def award_user_points
    if self.voteable_type == "Question"
      question = Question.find(self.voteable_id)
      user = question.user
    elsif self.voteable_type == "Answer"
      answer = Answer.find(self.voteable_id)
      user = answer.user
    end

    if self.up == true
      user.score += 10
      user.save
    else
      user.score -= 5
      user.save

      self.user.score -= 1
      self.user.save
    end
  end

  def adjust_vote_count
    if self.voteable_type == "Question"
      model = Question.find(self.voteable_id)
    elsif self.voteable_type == "Answer"
      model = Answer.find(self.voteable_id)
    end

    if self.up == true
      model.vote_count += 1
    else
      model.vote_count -= 1
    end

    model.save
  end
=======
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value,
            presence: true,
            inclusion: { in: [1, -1], message: "Vote must be 1 or -1" }
  validates :user, presence: true

  validate :check_against_self_voting

  before_save :adjust_points

  def check_against_self_voting
    return unless voteable.respond_to?(:user) && voteable.user

    if voteable.user == user
      errors.add(:user, "cannot vote on their own content")
    end
  end

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

>>>>>>> upstream/master
end

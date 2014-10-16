class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value, presence: true
  validates :value, inclusion: { in: [1, -1], message: "Vote must be 1 or -1" }
  validates :user, presence: true

  before_save :adjust_points

  def adjust_points
    if value == 1
      self.voteable.user.score += 10
      self.voteable.user.save
    elsif value == -1
      if self.voteable.user.score >= 5
        self.voteable.user.score -= 5
        self.voteable.user.save
      else
        self.voteable.user.score -= self.voteable.user.score
        self.voteable.user.save
      end
      user.score -= 1
      user.save
    end
  end

end

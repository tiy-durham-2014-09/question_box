class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true

  after_create :award_user_points

  def award_user_points
    if self.up == true
      user.score += 10
      user.save
    else
      user.score -= 5
      user.save
    end
  end
end

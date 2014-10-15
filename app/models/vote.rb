class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :up, presence: true
	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true
  #
  # def award_user_points
	 #  if up_changed?(to: true)
		#   user.score += 10
		#   user.save
	 #  end
  # end
end

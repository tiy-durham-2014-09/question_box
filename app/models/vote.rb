class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true

  after_create :award_user_points
  after_create :adjust_vote_count

  def award_user_points
    creator = voteable.user

    if up == true
      creator.score += 10
      creator.save
    else
      creator.score -= 5
      creator.save

      user.score -= 1
      user.save
    end
  end

  def adjust_vote_count
		model = voteable

    if up == true
      model.vote_count += 1
    else
      model.vote_count -= 1
    end

    model.save
  end
end

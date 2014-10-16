class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable, presence: true
  validates :value, numericality: { only_integer: true, less_than: 2, greater_than: -2 }

  after_save :subtract_voter_points
  after_save :award_author_points

  def subtract_voter_points
    if value == -1
      unless user.score == 0
        user.score -= 1
        user.save
      end
    end
  end

  def award_author_points
    if value == 1
      puts "vote is positive"
      voteable.user.score += 10
      puts "added 10 points to #{voteable.user.name}, whose score is now #{voteable.user.score}"
      voteable.user.save
    end
  end

end

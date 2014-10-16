class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable, presence: true
  validates :value, numericality: { only_integer: true, less_than: 2, greater_than: -2 }

  after_save :decreases_voters_score

  def decreases_voters_score
    user.score -= 1
  end

end

class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value, presence: true
  validates :value, inclusion: { in: [1, 2] }
  validates :user, presence: true

  after_save :give_points_to_recieving_user

  def give_points_to_recieving_user
    if value == 1
      user.score += 10
      user.save
    end
  end

end

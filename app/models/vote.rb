class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable

  validates :user, presence: true
  validates :voteable, presence: true
  validates :value, numericality: { only_integer: true }
  validates :value, inclusion: { in: %w(1, -1) }
end

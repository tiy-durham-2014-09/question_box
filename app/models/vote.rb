class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true

  #	is positive or negative (+1 or -1)

  #	when a positive vote is given to something a user created (question or answer), +10 points to that user

  #	when a negative vote is given to something a user created (question or answer), -5 points to that user

  #	when a user makes a negative vote, -1 points to that user
end

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true
  validates :value, numericality: { only_integer: true }

  # if a question or answer that a user created receives a positive vote, the creating user's score increases by 10 points (value of vote is 10)

  # if a question or answer that a user created receives a negative vote, the creating user's score decreases by 5 points (value of vote is -5)

  #	when a user makes a negative vote, -1 points to that user (the voter, not the creator of the content that was voted on)
end

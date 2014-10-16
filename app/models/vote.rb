class Vote < ActiveRecord::Base
  belongs_to :user

  #	belongs to a user

  #	belongs to a "voteable" (polymorphic association)

  #	is positive or negative (+1 or -1)

  #	when a positive vote is given to something a user created (question or answer), +10 points to that user

  #	when a negative vote is given to something a user created (question or answer), -5 points to that user

  #	when a user makes a negative vote, -1 points to that user
end

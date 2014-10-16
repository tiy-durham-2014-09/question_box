class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :value, inclusion: { in: [1, -1], message: "Vote must be +1 or -1" }
end

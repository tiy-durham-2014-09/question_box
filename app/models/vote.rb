class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :up, presence: true
	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true
end

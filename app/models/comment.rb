class Comment < ActiveRecord::Base
  belongs_to :user
	belongs_to :commentable, polymorphic: true

	validates :text, presence: true
	validates :user_id, presence: true
	validates :commentable_id, presence: true
	validates_datetime :date, on_or_before: lambda { Date.current }



end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

	validates :user, presence: true
  validates :text, presence: true
	validates :commentable_id, presence: true
  validates :commentable_type, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true
  validates :user, presence: true
  validates :commentable_id, presence: true
end

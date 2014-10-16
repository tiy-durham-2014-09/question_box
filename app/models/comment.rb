class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  #	belongs to a user
  #	belongs to a "commentable" (polymorphic association)
end

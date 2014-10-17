class Comment < ActiveRecord::Base
  attr_accesible :content
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end

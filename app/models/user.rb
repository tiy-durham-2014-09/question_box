class User < ActiveRecord::Base

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  validates :name, presence: true

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :comments, presence: true

  validates :votes, presence: true

  has_secure_password
end

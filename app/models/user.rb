require 'SecureRandom'

class User < ActiveRecord::Base

  has_secure_password

  has_many :questions
  has_many :answers

  has_many :comments
  has_many :votes

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  validates :name, presence: true

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_key
  # before_validation :set_user
  # after_create :send_email


  # def  set_user
  #   user = User.find_by(email: email)
  # end

  def set_key
    self.key = SecureRandom.uuid
  end

  def send_email
    ActivationMailer.account_activation(@user, @key).deliver
  end
end

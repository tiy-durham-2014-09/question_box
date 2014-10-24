class User < ActiveRecord::Base
  require 'securerandom'

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

  has_secure_password

  validates :key, presence: true

  before_validation :set_key

  private

  def set_key
    self.key = SecureRandom.uuid
  end

  def send_email
    VerificationMailer.email_verification(user).deliver
  end

end

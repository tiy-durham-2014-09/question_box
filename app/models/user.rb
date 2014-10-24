require 'securerandom'

class User < ActiveRecord::Base
	before_validation :set_key
	after_create :send_email

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

	private

	def set_key
		self.key = SecureRandom.uuid
	end

	def send_email
		SecurityMailer.user_verification(id).deliver
	end
end

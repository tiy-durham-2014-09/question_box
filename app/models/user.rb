require 'SecureRandom'

class User < ActiveRecord::Base
  
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
            
  # validates :token, presence: true
  

  has_secure_password
  
  before_validation :set_token
  # after_create :send_confirmation

  def to_s
    name
  end
 
  # def send_confirmation
 #    self.update_column(:click, true)
 #    UserMailer.registration_confirmation(@user).deliver
 #  end
  
  def set_token
   self.token = SecureRandom.urlsafe_base64
  end
  
  def activate_account
    self.update_attribute(:click, true)
  end
end

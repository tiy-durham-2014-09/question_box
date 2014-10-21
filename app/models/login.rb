class Login < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
  validate :validate_authentication
  
end

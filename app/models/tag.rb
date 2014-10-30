class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :users

  validates :name, presence: true
end

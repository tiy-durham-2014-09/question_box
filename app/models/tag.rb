class Tag < ActiveRecord::Base
  belongs_to :question
  has_many :tags

  validates :name, presence: true
  validates :question, presence: true


end

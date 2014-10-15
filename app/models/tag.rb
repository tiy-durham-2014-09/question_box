class Tag < ActiveRecord::Base
  has_and_belongs_to_many :question

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
  validates :question_id, presence: true
end

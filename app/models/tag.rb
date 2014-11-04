class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :users

  validates :name, presence: true

  def as_json(options={})
    { label: self.name, value: self.name }
  end
end

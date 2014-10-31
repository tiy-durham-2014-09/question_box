class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions

  validates :name, presence: true

  def as_json(options={})
    { label: self.name, value: self.name }
  end
end

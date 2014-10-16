class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true
  validates :value, { presence: true,
                      if: "value_is_valid" }

  def is_positive?
    self.value == 1
  end

  def is_negative?
    self.value == -1
  end

  def value_is_valid
    self.value == 1 || self.value == -1
  end
end

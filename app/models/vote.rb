class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  # validates :voteable_id, presence: true
  # validates :voteable_type, presence: true
  validates :value, { presence: true,
                      if: "value_is_valid" }

  after_create :scoring

  def is_positive?
    self.value == 1
  end

  def is_negative?
    self.value == -1
  end

  def value_is_valid
    self.value == 1 || self.value == -1
  end

  def scoring
    if value == 1
      user.score += 10
      user.save
    elsif value == -1
      user.score -= 5
      user.save
      # self.user.score -= 1
      # self.user.save
    end
  end
end

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable, presence: true
  validates :value, presence: true,
            numericality: { only_integer: true,
                            equal_to: 1 || -1 }


  # def up_vote
  #   self.votes.where(value: 10).count
  # end
  #
  # def down_vote
  #   self.votes.where(value: -5).count
  # end
  #
  # def give_down_vote
  #   self.votes.where(value: -1).count
  # end
  #
  # def points
  #   self.votes.sum(:value).to_i
  # end
end

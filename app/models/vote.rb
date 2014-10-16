class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

	validates :user, presence: true
	validates :voteable_id, presence: true
	validates :voteable_type, presence: true

  after_create :award_user_points

  def award_user_points
    if self.voteable_type == "Question"
      question = Question.find(self.voteable_id)
      user = question.user
    elsif self.voteable_type == "Answer"
      answer = Answer.find(self.voteable_id)
      user = answer.user
    end

    if self.up == true
      user.score += 10
      user.save
    else
      user.score -= 5
      user.save

      self.user.score -= 1
      self.user.save
    end
  end
end

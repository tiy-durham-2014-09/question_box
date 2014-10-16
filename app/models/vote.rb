class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :value, :inclusion => {:in => [true, false]}

  def current_user
    @current_user = current_user
  end

  def add_ten_points
    if value == true
      voteable.user.score += 10
      voteable.user.save
    end
  end

  def subtract_five_points
    if value == false
      voteable.user.score -= 5
      voteable.user.save
    end
  end

  # def subtract_one_point   # need to declare voter, not person being voted on
  #   if value == false
  #     voteable.user.score -= 1
  #     voteable.user.save
  #   end
  # end




  # def has_voted_true?
  #   answers.where(value: true).count + 1
  # end
  #
  # def has_voted_false?
  #   answers.where(value: false).count - 1
  # end
  #
  # def add_ten_points # If vote value is true 10 points are added to score
  #   if has_voted_true?
  #     user.question.score += 10
  #   end
  # end
  #
  # def subtract_five_points # If vote value is false 5 points are subtracted from score
  #   if has_voted_false?
  #     user.question.score -= 10
  #     @current_user.score -= 1
  #   end
  # end


end

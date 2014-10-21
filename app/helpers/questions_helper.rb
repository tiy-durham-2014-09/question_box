module QuestionsHelper
  def unanswered?
    id = self.id
    answers = Answer.where(question_id: id)
    answers.empty?
  end

  def score(type)
    values = []
    votes = Vote.where(voteable_id: type.id,
                       voteable_type: type.class.name)
    votes.each do |vote|
      values << vote.value
    end
    values.inject(:+)
  end
end



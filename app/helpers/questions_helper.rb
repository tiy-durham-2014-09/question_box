module QuestionsHelper
  def unanswered?
    id = self.id
    answers = Answer.where(question_id: id)
    answers.empty?
  end
end

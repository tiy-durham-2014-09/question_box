json.questions @questions do |question|
  json.extract! question, :id, :title, :text, :user_id, :created_at, :updated_at
  json.user question.user, :id, :name, :score, :email
  json.answers question.answers
end

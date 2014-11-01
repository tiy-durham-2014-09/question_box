json.(@question, :id, :title, :text, :score, :created_at)

json.user_id @question.user.id
json.user_name @question.user.name
json.user_score @question.user.score

json.tags @question.tags do |tag|
  json.name  tag.name
end

json.answers @question.answers do |answer|
  json.id answer.id
  json.text answer.text
  json.score answer.score
  json.chosen? answer.chosen
  json.user_id answer.user_id
  json.user answer.user.name
  json.created_at answer.created_at
end
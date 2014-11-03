json.array! @related_questions do |question|
	json.title question.title
	json.text question.text
	json.url question_url(question)
end
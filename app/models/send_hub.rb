class SendHub
  include HTTParty
  base_uri 'https://api.sendhub.com'

  def api_key
    Rails.application.secrets.sendhub_key
  end

  def username
    Rails.application.secrets.sendhub_number
  end

  def initialize
    @default_options = { query: {username: username, api_key: api_key},
                         headers: {"Content-Type" => "application/json"}}
  end

  def create_contact(name, number)
    options = @default_options.merge(body: {name: name, number: number}.to_json)
    res = self.class.post("/v1/contacts", options)

    if res.code == 201
      res["id_str"]
    else
      nil
    end
  end

  def send_answer_sms(answer)
    question = answer.question
    body = { "contacts" => [question.user.contact],
             "text" => "You have a new answer to your question " \
                 "'#{question.title}' : '#{answer.text.truncate(25)}'" }.to_json
    options = @default_options.merge(body: body)

    binding.pry
    self.class.post("/v1/messages", options)
  end
end
class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_many :comments
  has_many :votes

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  validates :name, presence: true

  # validates :phone,
  #           format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/, unless: "phone.nil?", message: "if you have a phone # it must be valid"}

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def send_text
    HTTParty.post("https://api.sendhub.com/v1/messages/?username=9194486757&api_key=4639f9b62be4b60ce70dfb54d30c11214f86f8e9", body: { "contacts" => [.contact], "text" => "You've got answers"}.to_json, headers: {"Content-Type" => "application/json"})
  end

  has_secure_password
end

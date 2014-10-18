class Login
  include ActiveModel::Model

  attr_accessor :email, :password
  attr_reader :user
  validates_presence_of :email, :password

  def initialize(attrs)
    super(attrs)
    @user = User.find_by(email: email)
  end

  def authenticated?
    user.authenticate(password) if user.present?
  end
end

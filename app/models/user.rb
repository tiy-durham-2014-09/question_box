class User < ActiveRecord::Base
	include Gravtastic
	gravtastic :default => 'identicon'

	has_many :questions
  has_many :answers

  has_many :comments
  has_many :votes

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  validates :name, presence: true

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def so_reputation
		if !so_url.blank?
			response = RubyStackoverflow.users({ inname: so_username })
			response.data.first.reputation
		end
	end

	def so_username
		so_url.split("/").last
	end

	def github_repos
		if !github_url.blank?
			response = github.repos.list user: github_url, sort: 'updated', direction: 'asc'
		end
	end

  has_secure_password
end

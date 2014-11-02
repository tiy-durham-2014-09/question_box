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
			response = Github.repos.list user: github_url, sort: 'updated', direction: 'asc'
			response
		end
	end
# def showing_github
# 	if !github_url.blank?
# 		# repos = Github::Client::Repos.new
# 		# response = repos.list user: github_url, per_page: 10, page: 5
# 		# github = Github.new auto_pagination: true
# 		github = Github.new basic_auth: 'jrchg1403@gmail.com:a4851dd56fa45b74362e41ebe281f1dc8117b5bc'
# 		github.oauth.create scopes: ['repo']
# 		repos = Github::Client::Repos.new
# 		response = repos.list user: github_url, per_page: 10
# 	end
# end

has_secure_password
end

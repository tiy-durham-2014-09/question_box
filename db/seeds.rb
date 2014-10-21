require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Question.delete_all
# Answer.delete_all
#
#
4.times do

	fake_name = Faker::Name.name
	user = User.create!(name: fake_name,
	                    score: rand(1..34),
	                    email: Faker::Internet.free_email(fake_name),
	                    password: "password")



	3.times do
	Question.create!(user: user,
									 title: "#{['In Rails, can I', 'How do you', 'Why would you'].sample} #{Faker::Company.bs}?",
	                 text: Faker::Lorem.sentence(3),
	                 created_at: rand(1.year).ago,
									 votevalue: 4
									 )
	end
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all


user = User.create!(name:                  Faker::Name.name,
                    email:                 "user@example.org",
                    password:              "password",
                    password_confirmation: "password")

5.times do
	fake_name = Faker::Name.name
	other_users = User.create!(name:                  Faker::Name.name,
	                    email:                 Faker::Internet.email,
	                    created_at:            rand(3.month).ago,
	                    location:              Faker::Address.city,
	                    bio:                   Faker::Lorem.sentences(10),
	                    github_url:            Faker::Internet.url,
	                    so_url:                Faker::Internet.url,
	                    twitter_url:           Faker::Internet.url,
	                    password:              "password",
	                    password_confirmation: "password") }

	rand(1..3).times do
		Question.create!(title:           "#{["Anyone know why the",
		                                   'Can someone explain why a',
		                                   "I don't understand why the"].sample}
		                                  #{Faker::Company.catch_phrase.downcase}
		                                  #{['keeps breaking',
		                                     "won't work",
		                                     'is stuck in a loop'].sample}?",
		                text:             Faker::Lorem.paragraph(sentence_count=10, supplemental=false, random_sentences_to_add=3),
		                user:             other_users.sample,
		                resolved:         false,
		                created_at:       rand(3.month).ago,)
	end
end


questions = Question.all

20.times do
	Answer.create!(question: questions.sample,
	               text:     Faker::Hacker.say_something_smart,
	               user:     other_users.sample)
end

answers = Answer.all

50.times do
	Vote.create(voteable: (questions + answers).sample,
	            user:     other_users.sample,
	            value:    [1, 1, 1, 1, 1, -1].sample)
end





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password",
              created_at: Faker::Date.backward(200))
end

100.times do
  Question.create(title: Faker::Hacker.verb + " " +
                         Faker::Hacker.adjective + " " +
                         Faker::Hacker.noun + "?",
                  text:  Faker::Hacker.say_something_smart + "?",
                  user_id: rand(25),
                  created_at: Faker::Date.backward(200))
end

150.times do
  Answer.create(text: Faker::Hacker.say_something_smart + " " +
                      Faker::Hacker.say_something_smart + " " +
                      Faker::Hacker.say_something_smart+ "!",
                user_id: rand(50),
                question_id: rand(85),
                created_at: Faker::Date.backward(200))
end

200.times do
  Vote.create(user_id: rand(50),
              value: [-1, 1].sample,
              voteable_id: rand(100),
              voteable_type: ["Question", "Answer"].sample,
              created_at: Faker::Date.backward(200))
end
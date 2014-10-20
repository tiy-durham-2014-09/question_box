require "faker"

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

5.times do

  fake_name = Faker::Name.name
  user = User.create!(name: fake_name,
                      email: Faker::Internet.free_email(fake_name),
                      password: "password")

  rand(2..10).times do
    Question.create!(user: user,
                 title: Faker::Lorem.sentence(3),
                 text:  Faker::Lorem.sentence(50))
  end
end

user = User.create!(name: "Kheang",
                    email: "email@gmail.com",
                    password: "password")

rand(2..10).times do
  Question.create!(user: user,
                   title: Faker::Lorem.sentence(3),
                   text:  Faker::Lorem.sentence(50))
end

questions = Question.all
users = User.all.pluck("id")

questions.each do |question|
  rand(0..3).times do
    question.answers.create!(user: User.find(users.sample),
                             text: Faker::Lorem.sentence(5))
  end
end

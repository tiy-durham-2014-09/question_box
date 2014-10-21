# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Question.delete_all

@users = []
15.times do
  password = Faker::Internet.password
  user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      created_at: Faker::Time.between(60.days.ago, Time.now, :all)

  )
  @users << user
end

@questions = []
@users.each do |u|
  rand(1..5).times do
    question = Question.create(
        title: ["How do I even ", "Why would I ever ", "Don't you hate it when you can't ", "Bro, do you even ", "Why can't I " ].sample + Faker::Company.bs + "?",
        text: Faker::Lorem.paragraph.to_s.chomp + "?",
        user_id: u.id,
        created_at: Faker::Time.between(u.created_at, Time.now, :all)
    )
    @questions << question
  end
  rand(0..2).times do
    question = Question.create(
        title: 'What does "' + Faker::Company.bs + '" even mean?',
        text: Faker::Lorem.paragraph.to_s.chomp + "?",
        user_id: u.id,
        created_at: Faker::Time.between(u.created_at, Time.now, :all)
    )
    @questions << question
  end
end

@answers = []
@questions.each do |q|
  rand(0..5).times do
    answer = Answer.create!(
        text: [["Obviously you didn't ", "Duh, just ", "Don't forget to "].sample + Faker::Company.bs + ".", "I got nothin'.", "It's all greek to me.  Or Latin, whatever."].sample,
        user_id: @users.sample.id,
        question_id: q.id,
        created_at: Faker::Time.between(q.created_at, Time.now, :all)
    )
    @answers << answer
  end
end
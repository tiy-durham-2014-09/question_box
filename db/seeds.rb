# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.delete_all

Question.create(title: "Oi sir, what are you doing?", text: "Uh... trudging. You know, trudging? To trudge: the slow, weary, depressing yet determined walk of a man who has nothing left in life except the impulse to simply soldier on.", user_id: 4)
Question.create(title: "Sir Ulrich. What are you wearing to the ball tonight?", text: "Er... nothing...", user_id: 5)

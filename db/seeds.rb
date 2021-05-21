# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'net/http'


# uri = URI('https://opentdb.com/api.php?amount=10&category=11&difficulty=hard')
# resp = Net::HTTP.get(uri)

# questions = JSON.parse(resp)

# # fuck = questions["results"].each { |q| q[0] }

# fuckyes = questions["results"].each do |ques|
#     # answers = []

#     # ques["incorrect_answers"].each do |ic|
#     #     answers << incorrect_answers
#     # end

#     # answers << ques["correct_answer"]

#     question = {
#         category: ques["category"],
#         question_type: ques["type"],
#         difficulty: ques["difficulty"],
#         question: ques["question"],
#         correct_answer: ques["correct_answer"],
#         incorrect_answers: ques["incorrect_answers"],
#         points: 10
#     }



#     # byebug

#     Question.create(question)
# end

# # Question.create!(fuck)


# # byebug
puts "SEEDED"

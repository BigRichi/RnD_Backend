class QuestionSerializer
  include JSONAPI::Serializer
  attributes :category, :type, :difficulty, :question, :correct_answer, :incorrect_answers, :points

  serialize :incorrect_answers, Array
end

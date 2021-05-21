class GameQuestionSerializer
  include JSONAPI::Serializer
  attributes 

  belongs_to: questions
  belongs_to: game 
end

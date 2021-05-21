class GameSerializer
  include JSONAPI::Serializer
  attributes :score, :game_type, :time, :num_of_questions

  belongs_to: user
end

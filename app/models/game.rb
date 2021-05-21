class Game < ApplicationRecord
  belongs_to :user
  has_many :game_questions, dependent: :destroy
end

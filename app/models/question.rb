class Question < ApplicationRecord
    has_many :game_questions, dependent: :destroy
end

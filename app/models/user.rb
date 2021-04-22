class User < ApplicationRecord
    has_many :games, dependent: :destroy
    has_many :game_questions, through: :game

    validates :username, uniqueness: { case_sensitive: false }

    def update_high_score
        last_game = self.games.last
        if self.high_score <= last_game.score
            last_game.score
        else
            self.high_score
        end
    end

    def self.order_by_high_score
        all.sort_by(&:high_score)
    end 

    def update_rank
        User.order_by_high_score.find_index(self) + 1
    end

    def total_wins
        total_score = self.games.sum{|game| game.score}
        total_questions = self.games.sum{|game| game.num_of_questions}
        ((total_score.to_f)/(total_questions*10)).round(2)
    end

    def self.win_ratio
        all.map do |user| 
           {
            user: user,
            correct_answer_ratio: user.total_wins
            }
        end
    end

end

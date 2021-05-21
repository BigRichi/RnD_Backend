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

        total_questions = self.games.sum do |game| 
            if game.difficulty == "easy"
                game.num_of_questions*10
            elsif game.difficulty == "medium"
                game.num_of_questions*20
            else 
                game.num_of_questions*30
            end
        end

        if total_questions != 0
            (((total_score.to_f)/(total_questions)).round(2))*100
        else
            0
        end

    end

    def self.win_ratio
        self.order_by_high_score.map do |user| 
            {
            user: user,
            correct_answer_ratio: user.total_wins
            }
        end
    end

end

class GamesController < ApplicationController

    def index
        @games = Game.all

        render json: @games
    end

    def gameover
        @game = params.permit!()

        new_game = {
            score: @game["score"],
            game_type: @game["game_type"],
            time: @game["time"],
            num_of_questions: @game["num_of_questions"],
            difficulty: @game["difficulty"],
            user_id: @game["user_id"]          
        }

        Game.create(new_game)

        @user = User.find_by(id: @game["user_id"])
        new_high_score = @user.update_high_score
        @user.update(high_score: new_high_score)
        new_rank = @user.update_rank
        @user.update(rank: new_rank)
        render json: @user
    end

end

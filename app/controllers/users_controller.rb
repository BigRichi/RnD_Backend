class UsersController < ApplicationController



    def index
        @user = User.all
    end

    def login
        
        user = User.find_by(username: params[:username], password_digest: params[:password])
        if user 
        token = JWT.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
        render json: { user: user, token: token }
        else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
        
    end

    # POST /signup
    def signup
        user_params = params.permit(:username, :password_digest, :rank, :high_score)
        new_user = {username: user_params["username"], password_digest: user_params["password_digest"], rank: User.all.length+1, high_score: 0}
        user = User.create(new_user)
        if user.valid?
        token = JWT.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
        render json: { user: user, token: token }, status: :created
        else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # GET /me
    # def show 

    # render json: @current_user
    # end

    # PATCH /me
    # def game_stats
    #     user = User.find_by(id: params[:id])
    #     new_high_score = user.update_high_score
    #     user.update(high_score: new_high_score)
    #     new_rank = user.update_rank
    #     user.update(rank: new_rank)
    #     render json: user
    # end

    def top_five
        top_five_users = User.order_by_high_score.reverse.first(5)
        users_win_ratio = User.win_ratio.reverse
        render json: {top_five_users: top_five_users, users_win_ratio: users_win_ratio}
    end 

end

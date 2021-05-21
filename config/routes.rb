Rails.application.routes.draw do
  # resources :game_questions
  resources :games
  # resources :users
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  patch "/users/game_stats/:id", to: "users#game_stats"
  get '/users/top_five', to: "users#top_five"
  post '/questions/choose_game', to: 'questions#choosegame'
  post '/games/gameover', to: 'games#gameover'
  # post '/users/new_user', to: 'users#newuser'
  # post '/users/login', to: 'users#login'

  post "/login", to: "users#login"
  post "/signup", to: "users#signup"
  get "/me", to: "users#show"
  patch "/me", to: "users#update"
end

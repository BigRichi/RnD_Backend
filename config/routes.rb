Rails.application.routes.draw do
  resources :game_questions
  resources :games
  resources :users
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

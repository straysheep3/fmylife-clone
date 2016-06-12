Rails.application.routes.draw do
  devise_for :users

  resources :stories do
    member do
      put :like, to: "stories#upvote"
      put :dislike, to: "stories#downvote"
    end
  end

  root "stories#index"

  get "/topstories", to: "pages#topstories", as: "topstories"
  get "/randomstories", to: "pages#randomstories", as: "randomstories"
end

Rails.application.routes.draw do
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  get "/login", to: "user_sessions#new"
  get "/logout", to: "user_sessions#destroy"
end

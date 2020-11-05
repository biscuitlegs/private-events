Rails.application.routes.draw do
  root to: "events#index"
  resources :events

  resources :users, except: :index
  resources :user_sessions, only: [:new, :create, :destroy]

  get "/login", to: "user_sessions#new"
  get "/logout", to: "user_sessions#destroy"
end

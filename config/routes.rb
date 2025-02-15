Rails.application.routes.draw do
  # Root page for the homepage (Welcome message)
  root "home#index"

  # Authentication routes
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # User routes
  resources :users, only: [:create, :show]
  get "/profile", to: "users#profile", as: "profile"

  # Books routes
  resources :books, only: [:index, :show] do
    patch :borrow, on: :member      # Change from post to patch
    patch :return_book, on: :member # Change from post to patch
  end
end

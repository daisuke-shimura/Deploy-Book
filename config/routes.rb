Rails.application.routes.draw do

  root to: "homes#top"
  get 'about' => "homes#about"
  devise_for :users

  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
    resources :book_comments, only: [:edit, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
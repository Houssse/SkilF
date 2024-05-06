Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :articles

  resources :comments

  root "articles#index"

end

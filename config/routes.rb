Rails.application.routes.draw do

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  root "home#top"
  resources :articles
  get 'salons/category/:id' => 'salons#category'
  resources :salons do
    resources :posts
  end
  
  resources :salon_joins
  resources :notifications

  
  get 'about' => "home#about"
end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


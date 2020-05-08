Rails.application.routes.draw do

  root "home#top"
  
  resources :categories, only: [:new, :create, :edit, :update, :index]

  resources :inquiries, only: [:new, :create, :index] do 
     resources :answers, only: [:new, :create]
  end
  

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  
  resources :users, only: [:show, :index]
  

  resources :articles
  get 'salons/category/:id' => 'salons#category'
  resources :salons do
    resources :posts
    resources :salon_joins, only: [:index, :create, :update]
    resources :chats, except: [:show]
  end
  
  get 'salons/:salon_id/chats/:user_id' => 'chat#show'
  get 'joined_salons' => 'salon_joins#joined_salons'
  
 
  get 'about' => "home#about"
end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


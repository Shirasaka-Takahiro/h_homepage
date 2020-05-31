Rails.application.routes.draw do  

  get 'categories/new'
  get 'categories/show'
  resources :galleries

  root 'home#index'

  devise_for :users

  resources :users

  get 'works/index'
 
  get 'abouts/show'


end

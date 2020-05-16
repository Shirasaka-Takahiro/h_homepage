Rails.application.routes.draw do  

  get 'abouts/show'
  get 'abouts/edit'

  root 'home#index'

  devise_for :users

  
  resources :users

  resources :works

end

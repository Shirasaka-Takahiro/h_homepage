Rails.application.routes.draw do  

  resources :galleries  

  root 'home#index'

  devise_for :users

  resources :users

  get 'works/index'
 
  get 'abouts/show'

end

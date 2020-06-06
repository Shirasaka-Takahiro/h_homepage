Rails.application.routes.draw do  

  get 'categories/new'
  get 'categories/show'
  resources :galleries do
    collection do
      get 'tag'
    end
  end

  root 'home#index'

  devise_for :users

  resources :users

  get 'works/index'
 
  get 'abouts/show'

  #get 'tags/:tag', to: 'galleries#index', as: :tag
end

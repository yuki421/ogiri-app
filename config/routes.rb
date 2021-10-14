Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'photos#index'
  resources :photos do
    resources :comments, only:[:new, :create, :destroy] 
  end
  resources :users
end

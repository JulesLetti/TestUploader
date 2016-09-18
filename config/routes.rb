Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :photos, only: [:new, :create, :index, :destroy]

root to: 'photos#index'
end

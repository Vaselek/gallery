Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  root 'images#index'

  resources :images do
    resources :commentaries, only: [:create, :index]
  end

  resources :commentaries, only: :destroy

  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

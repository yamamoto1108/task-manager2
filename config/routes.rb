Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :users, only: [:show, :edit, :update]
  resources :teams

  resources :boards do
    resources :lists do
      put :sort
    end
    resources :cards do
      put :sort
    end
  end
  
end

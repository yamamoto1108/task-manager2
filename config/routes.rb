Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards do
    resources :lists do
      put :sort
    end
  end
  
  resources :cards do
    put :sort
  end
end

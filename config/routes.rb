Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :new]

  resources :mypages, only: [:index] do
    collection do
      get 'logout'
    end
  end
end

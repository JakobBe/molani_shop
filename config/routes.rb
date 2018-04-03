Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'cart_items/user_index'

  post '/cart_item', to: 'cart_items#create'

  delete '/cart_item', to: 'cart_items#destroy'

  devise_for :users
  root to: 'pages#home'
  resources :items, only: [:index, :show] do
    collection do
      get 'category', to: 'items#category'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

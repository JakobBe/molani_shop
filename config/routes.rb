Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items, only: [:index, :show] do
    collection do
      get 'category', to: 'items#category'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do  get 'welcome/index'
  get 'welcome/index'
  root 'welcome#index'

  resources :users
  get '/signup', to: 'users#new'

  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/logout', to: 'sessions#logout'

  resources :articles do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

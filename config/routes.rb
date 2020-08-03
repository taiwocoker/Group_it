Rails.application.routes.draw do
  resources :groups, except: [:destroy]
  resources :expenses
  resources :users
  root 'home#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'external', :to => "expenses#external"
end

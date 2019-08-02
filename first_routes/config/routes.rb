Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :create, :destroy] do
    resources :artworks, only: :index
    resources :comments, only: :index
  end
  resources :artworks, only: [:show, :update, :create, :destroy] do
    resources :comments, only: :index
  end
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new' 
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

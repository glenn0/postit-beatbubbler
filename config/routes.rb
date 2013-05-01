Postit::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    member do
      post 'vote'
    end
    collection do
      post 'archive'
    end
    resources :comments, only: [:create]
      member do
        post 'vote'
      end
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :categories

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/logout', to: 'sessions#destroy'
end
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get 'sessions/new'
  get 'sessions/create'
  get('/', {to: 'posts#index', as: :root})
  get 'posts/new'
    

  resources :posts do
  resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

end

Homify::Application.routes.draw do
  root 'articles#index'

  devise_for :users
  resources :articles

  # TODO: Remove this
  get '/home', to: 'pages#home', as: 'home'
end

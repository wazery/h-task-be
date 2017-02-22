Homify::Application.routes.draw do
  resources :articles
  devise_for :users
  root 'pages#home'

  get '/home', to: 'pages#home', as: 'home'
end

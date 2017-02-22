Homify::Application.routes.draw do
  root 'articles#index'

  devise_for :users

  resources :articles

  get 'tags/:tag', to: 'articles#index', as: :tag, constraints: { tag: /[^\/]+/ }

  match 'search', to: 'articles#index', as: 'search', via: %i(post get)
end

Rails.application.routes.draw do


  devise_for :users
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'static_pages#signup'
  get '/login', to: 'static_pages#login'
  get "*path", to: redirect('/')

  #Resources Must Go Here. Don't move above.
  resources :suggestions
  resources :teams, :stocks, :holdings

end

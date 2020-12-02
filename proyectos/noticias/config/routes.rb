Rails.application.routes.draw do
  devise_for :users
  #El primer nombre "Home" es lo que va en el url www.algo/"algo" esto me va a llevar a la acción home del staticpages
  get 'home', to: 'static_pages#home'
  get 'dashboard', to: 'users#dashboard'

  resources :notices, only: [:index, :show]
  namespace :admin do
    resources :notices
  end

  resources :comments, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end

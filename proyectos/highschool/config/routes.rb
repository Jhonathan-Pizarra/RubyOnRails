Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'statics#static_pages'

  #Admin
  namespace :administrador do
    resources :users
    resources :courses
    get 'stadistics', to: 'courses#stadistics'
    get 'stadistics_users', to: 'users#stadistics_users'

  end

  #Alumnos
  resources :alumns

  #Dashboard
  get 'dahsboard', to: 'statics#dahsboard'


end


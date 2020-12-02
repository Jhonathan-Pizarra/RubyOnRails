Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #El primer nombre "ethymons" es lo que va en el url www.algo/"algo" esto me va a llevar a la acción index del hospital_controller
  root 'ethymons#index' #Cualquier nombre:  sistema_medico..

  #Room
  get 'room', to: 'users#room'

  #Patienes
  resources :patients
  get 'stadistic', to: 'patients#stadistic'

  #Admin
  namespace :admin do
    resources :users
    get 'stadistic', to: 'users#stadistic'
  end

  #Visit
  resources :visits

end

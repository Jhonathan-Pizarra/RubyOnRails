Rails.application.routes.draw do
  root 'courses#index' #ruta root es cursos de la universidad
  get 'about', to: 'pages#about'
  get 'courses/new', to: 'courses#new'

  resources :students, except: [:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

end

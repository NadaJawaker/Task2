Rails.application.routes.draw do
  
  resources :submission_runs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :imgs
root 'pages#home'

#get 'pages/home', to: 'pages#home'

get 'about', to: 'pages#about'

resources :submissions

get 'signup', to: 'users#new'
resources :users, except: [:new]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

post 'api', to: 'api#test'


end

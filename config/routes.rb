Rails.application.routes.draw do

  resources :resources

  resources :tags, only: [:new, :create, :show]

  root 'resources#index'

  resources :users, except: [:index, :update, :edit, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

 get '/4XuibdvyYYkaulCUp2CN', to: 'users#admin_new'
 post '/4XuibdvyYYkaulCUp2CN', to: 'users#admin_create'

end

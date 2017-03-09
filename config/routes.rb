Rails.application.routes.draw do

  resources :resources

  resources :tags, only: [:new, :create, :show]

  root to: "resources#index"

  resources :users, except: [:index, :update, :edit, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

end

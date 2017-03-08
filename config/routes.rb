Rails.application.routes.draw do

 resources :resources
 root to: "resources#index"

 resources :users, except: [:index, :update, :edit, :destroy]

end

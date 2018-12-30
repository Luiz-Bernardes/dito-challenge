Rails.application.routes.draw do
  resources :points, only: [:index]
  resources :users, only: [:index]
   
  get 'user/:id/historic' , to: 'users#historic', as: 'historic'
  root to: 'users#index'
end

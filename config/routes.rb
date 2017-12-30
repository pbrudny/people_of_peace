Rails.application.routes.draw do
  devise_for :users
  resources :people
  resources :coordinators
  root 'people#index'
end

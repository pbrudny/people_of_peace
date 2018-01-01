Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:index, :edit, :update, :show, :destroy]

  resources :people do
    member do
      get 'help'
    end
  end
  root 'people#index'
end

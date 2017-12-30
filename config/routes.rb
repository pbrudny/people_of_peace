Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :people do
    member do
      get 'help'
    end
  end
  resources :coordinators
  root 'people#index'
end

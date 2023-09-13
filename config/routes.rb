Rails.application.routes.draw do
  root 'landings#index'
  devise_for :users
  resources :users
  resources :groups do
    resources :bills
  end
end

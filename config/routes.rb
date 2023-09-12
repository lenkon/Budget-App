Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :groups do
    resources :bills
  end
end

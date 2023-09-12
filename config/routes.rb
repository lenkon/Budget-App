Rails.application.routes.draw do
  resources :users
  resources :groups do
    resources :bills
  end
end

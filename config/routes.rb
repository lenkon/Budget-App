Rails.application.routes.draw do
  resources :groups do
    resources :bills
  end
end

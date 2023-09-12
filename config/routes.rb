Rails.application.routes.draw do
  get 'group_bills/index'
  get 'group_bills/show'
  get 'group_bills/new'
  get 'group_bills/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  resources :groups do
    resources :bills
  end
end

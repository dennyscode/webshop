Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  get 'products/id:' => 'products#index'
  # root 'simple_pages#index
  root 'simple_pages#landing_page'
  # root 'products#index'
  get 'products/hello' => 'products#hello'
  get '/products', to: 'products#index'
  resources :products
  get 'orders/show' => 'orders#show'
  get 'orders/index' => 'orders#index'
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy] #or resources :users, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

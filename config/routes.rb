Rails.application.routes.draw do
  resources :users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
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
  resources :products do
    resources :comments
  end
  get 'orders/show' => 'orders#show'
  get 'orders/index' => 'orders#index'
  get 'users/index' => 'users#index'
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy] #or resources :users, except: [:index]
  # get 'devise/sessions#destroy' => 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

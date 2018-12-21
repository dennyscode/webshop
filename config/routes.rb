Rails.application.routes.draw do

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'products/id:' => 'products#index'
  # root 'simple_pages#index
  root 'simple_pages#landing_page'
  get 'products/hello' => 'products#hello'
  resources :products
  get 'orders/show' => 'orders#show'
  get 'orders/index' => 'orders#index'
  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

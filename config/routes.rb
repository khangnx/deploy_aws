Rails.application.routes.draw do
  get 'chat_room' => 'home#index'
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  resources :categories
  resources :posts
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'store', to: 'store#index'
  resources :products
  root :to => 'store#index'

  get 'admin' => 'admin#index'
  controller :sessions do 
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  controller :chatwork do 
    get 'chatwork' => :index
    post '/chatwork' => :send_message
  end
  resources :export_orders
  resources :imports
  get 'error_404', to: 'errors#not_found'
  get 'error_505', to: 'errors#internal_server_error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

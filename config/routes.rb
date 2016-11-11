Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'

  get 'payments/create'
  get 'payments/create2'

  get 'static_pages/gallery'

  resources :products do
    resources :comments
  end
  
  get 'static_pages/faq'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'welcome/index'

  post 'static_pages/thank_you'

  post 'payments/create'
  post 'payments/create2'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'
  root 'static_pages#index'

  resources :orders, only: [:index, :show, :create, :destroy]

  devise_for :users, controllers: { registrations: "registrations", passwords: "passwords" }, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :users
end

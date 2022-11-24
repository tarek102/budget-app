Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
  resources :entities
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :group_entities, only: [:index]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  unauthenticated do
    root 'splash#index'
  end

  authenticated do
    root 'groups#index', as: :authenticated_root
  end
end

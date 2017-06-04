Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'portals#index'
  get 'index', to: 'portals#index', format: 'html'

  resources :authentication_methods, only: [:index, :create, :update, :destroy], format: 'json', path: 'api/authentication_methods'
  resources :permissions,            only: [:index, :create, :update, :destroy], format: 'json', path: 'api/permissions'
  resources :roles,                  only: [:index, :create, :update, :destroy], format: 'json', path: 'api/roles'
  resources :users,                  only: [:index, :create, :update, :destroy], format: 'json', path: 'api/users'
end



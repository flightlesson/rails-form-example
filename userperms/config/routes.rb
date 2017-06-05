Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'portals#index'
  get 'index', to: 'portals#index', format: 'html'

  resources :authentication_methods, only: [:index, :create, :update, :destroy], format: 'json', path: 'api/authentication_methods'
  resources :permissions,            only: [:index, :create, :update, :destroy], format: 'json', path: 'api/permissions' do
    resources :roles,                only: [:index, :create, :update, :destroy], format: 'json'
  end
  resources :roles,                  only: [:index, :create, :update, :destroy], format: 'json', path: 'api/roles' do
    resources :permissions,          only: [:index, :create, :update, :destroy], format: 'json'
    resources :users,                only: [:index, :create, :update, :destroy], format: 'json'
  end
  resources :users,                  only: [:index, :create, :update, :destroy], format: 'json', path: 'api/users' do
    resources :roles,                only: [:index, :create, :update, :destroy], format: 'json'
  end
end



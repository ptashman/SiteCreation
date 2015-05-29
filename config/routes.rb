SampleApp::Application.routes.draw do

  resources :owners
  resources :sites do
    get :welcome
    resources :users do
      member do
        get :following, :followers
        post :contact
      end
    end
    resources :microposts,    only: [:index, :create, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :user_sessions,      only: [:new, :create, :destroy]
    match '/signup',  to: 'users#new',            via: 'get'
    match '/signin',  to: 'user_sessions#new',         via: 'get'
    match '/signout', to: 'user_sessions#destroy',     via: 'delete'
  end
  resources :sessions,      only: [:new, :create, :destroy]
  match '/signup',  to: 'owners#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  root to: 'static_pages#home'
end
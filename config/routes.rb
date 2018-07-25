Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  #devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :dogs, :users, :walks
  resources :welcome, :only => [:home]
  resources :sessions, :except => [:show, :index, :update]


  resources :users do
    resources :dogs, :walks
  end

  resources :dogs do
    resources :walks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/auth/github/callback' => 'sessions#create'

  get '/signout' => 'sessions#destroy', :as => :signout
  get '/logout' => 'sessions#destroy', :as => :logout
end

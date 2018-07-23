Rails.application.routes.draw do

  resources :dogs, :users, :welcome, :sessions, :join_walks, :walks

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
end

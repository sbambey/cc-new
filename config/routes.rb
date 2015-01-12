Rails.application.routes.draw do
  resources :scrape_nodes, only: [:create, :destroy]
  resources :admin_notices, only: [:create, :destroy]

  devise_for :admins

  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'main#index'
  resources :airlines, only: [:index, :show, :new, :create] do
    resources :fly, only: [:show, :new, :create, :edit, :update]
  end

  get 'admin_panel/home'
end

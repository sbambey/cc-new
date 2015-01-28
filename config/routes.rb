Rails.application.routes.draw do
  get 'static_pages/contact'

  get "main/opportunities"

  get 'landing/show'

  resources :scrape_nodes, only: [:create, :destroy]
  resources :admin_notices, only: [:create, :destroy]

  devise_for :admins

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :main, only: [:index]
  resources :airlines, only: [:index, :show, :new, :create, :edit, :update] do
    resources :fly, only: [:show, :new, :create, :edit, :update]
  end

  get "admin_panel/home"
  get "admin_panel/progress"
  get "admin_panel/untracked"
  root 'landing#show'
end

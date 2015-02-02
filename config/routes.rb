Rails.application.routes.draw do
  get 'static_pages/contact'
  get "static_pages/mission"

  get "main/opportunities"

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
  get "admin_panel/user_management"
  root 'static_pages#landing'
end

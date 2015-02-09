Rails.application.routes.draw do
  get "contact" => "static_pages#contact"
  get "mission" => "static_pages#mission"
  get "blog" => "static_pages#blog"

  get "jobs" => "board#all"
  get "board" => "board#active"
  get "general" => "board#general_recruitment"

  #resources :scrape_nodes, only: [:create, :destroy]
  #resources :admin_notices, only: [:create, :destroy]

  #devise_for :admins

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :type_ratings, only: [:index]
  #resources :type_ratings_static
  resources :airlines, only: [:index, :show, :new, :create, :edit, :update] do
    resources :fly, only: [:show, :new, :create, :edit, :update]
  end

  get "admin_panel/home"
  get "admin_panel/progress"
  get "admin_panel/untracked"
  get "admin_panel/user_management"
  root 'static_pages#landing'
end

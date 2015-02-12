Rails.application.routes.draw do
  get "/sitemap.xml.gz" => "sitemaps#show"

  get "contact" => "static_pages#contact"
  get "mission" => "static_pages#mission"
  get "blog" => "static_pages#blog"

  get "board" => "board#matched"
  get "jobs" => "board#all"
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

  root 'board#matched'
end

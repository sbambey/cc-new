Rails.application.routes.draw do
  get "/sitemap.xml.gz" => "sitemaps#show"

  get "contact" => "static_pages#contact"
  get "mission" => "static_pages#mission"
  get "blog" => "static_pages#blog"

  get "board" => "board#matched"
  get "jobs" => "board#all"
  get "general" => "board#general_recruitment"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :type_ratings, only: [:index]

  resources :airlines, only: [:index, :show, :new, :create, :edit, :update] do
    resources :fly, only: [:show, :new, :create, :edit, :update]
  end

  get "admin_panel/home"
  get "admin_panel/progress"
  get "admin_panel/untracked"
  get "admin_panel/user_management"

  authenticated :user do
    root to: "board#matched", as: "authenticated_root"
  end

  unauthenticated do
    root to: "board#all"
  end
end

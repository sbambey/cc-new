Rails.application.routes.draw do
  get "/sitemap.xml.gz" => "sitemaps#show"

  get "contact" => "static_pages#contact"
  get "mission" => "static_pages#mission"

  get "board" => "board#matched"
  get "jobs" => "board#all"
  get "general" => "board#general_recruitment"

  devise_for :users, controllers: { registrations: "users/registrations" }, :path => 'accounts'

  resources :users do
    resources :blog_posts, only: [:create]
  end

  resources :blog_posts, only: [:new, :destroy]
  get "blog" => "blog_posts#index"
  get "blog/:id" => "blog_posts#show", as: :show_blog_post

  resources :airlines, only: [:show, :new, :create, :edit, :update] do
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

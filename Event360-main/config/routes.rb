require_relative "../lib/nxt_apps_constraint"

Rails.application.routes.draw do
  #get 'home_page/index'
  use_doorkeeper do
    controllers :applications => 'nxt_apps'
  end

  # Add a route for OAuth logout
  get 'oauth/logout', to: 'sessions#destroy', as: 'oauth_logout'

  resources :users

  # Homepage Routes
  root to: 'home_page#index'

  # Session and user routes
  get '/' => 'users#index'
  post 'users' => 'users#create'
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # App routes
  scope 'app/:app', constraints: NxtAppsConstraint.new do
    resources :posts
    resources :email_templates
    get '/' => 'crms#index'
    get 'admin', to: 'admin#userpage', as: 'admin'
    get 'admin/index', to: 'admin#index', as: 'adminview'
    get 'analytics', to: 'analytics#index', as: 'analytics'
    get 'posts/bytype/:user_type', to: 'posts#bytype', as: 'bytype'
    post 'posts/sendto', to: 'posts#sendto', as: 'sendto'
    get 'email_templates/:title/fill_in' => 'email_templates#fill_in', as: 'fill_in'
  end

  get 'crmusers' => 'users#usermanage'
  get 'dashboard' => 'dashboard#index'
  post 'update_permission', to: 'users#update_permission'
  get 'home' => 'user_dashboard#index'

  # Password Stuff
  get "password" => "passwords#edit"
  patch "password" => "passwords#update"

  # Password Reset
  get "password/reset" => "password_resets#new"
  post "password/reset" => "password_resets#create"
  get "password/reset/edit" => "password_resets#edit"
  patch "password/reset/edit" => "password_resets#update"

  #Admin Mailer

  # get "admin/request" => "admin_requests#new"
  # post "admin/request/tokenUser" => "admin_requests#tokenUser"
  # get "admin/request/tokenUser" => "admin_requests#tokenUser"
  # patch "admin/request/tokenUser" => "admin_requests#approve"

  scope "admin/request" do
    get   "/" => "admin_requests#new",as: :adrq_new
    post  "tokenUser" => "admin_requests#tokenUser", as: :adrq_post
    get   "tokenUser" => "admin_requests#tokenUser", as: :adrq_get
    patch "tokenUser" => "admin_requests#approve" , as: :adrq_approve
  end

  # API routes for other OAuth apps
  namespace :api do
    get 'user' => 'user#show'
  end
end

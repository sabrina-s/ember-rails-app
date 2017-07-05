Rails.application.routes.draw do

  root to: 'api/projects#index'
  devise_for :admins
  namespace :api do
    resources :projects, only: [:index]
  end

  namespace :admin do
    resources :projects
  end

  mount_ember_app :frontend, to: "/"

end

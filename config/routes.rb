Rails.application.routes.draw do

  devise_for :admins
  namespace :api do
    resources :projects, only: [:index]
  end

  mount_ember_app :frontend, to: "/"

end

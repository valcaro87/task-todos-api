Rails.application.routes.draw do
  resources :tasks

  namespace :api do
    namespace :v1 do
      resources :tasks #, only: [:index, :show, :create, :destroy]
    end
  end

end

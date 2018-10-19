Rails.application.routes.draw do
  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:index]
end

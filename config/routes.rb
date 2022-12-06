require "sidekiq/web"

Rails.application.routes.draw do
  resources :raw_images
  resources :labels
  namespace :annotation_editor do
    resources :labels do
      resources :raw_images, only: %i[show create update]
    end
  end

  draw :madmin
  get "/privacy", to: "home#privacy"
  get "/terms", to: "home#terms"
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :madmin do
      resources :impersonates do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

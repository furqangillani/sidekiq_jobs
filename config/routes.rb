require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root 'pages#home'
  post 'hello', to: 'pages#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

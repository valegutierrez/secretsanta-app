Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'notifications/index'
  get 'welcome/index'
  get 'create_conversations/:id', controller: 'events', action: 'create_conversations', as: 'create_conversations'
  get 'shared_event/:code', controller: 'events', action: 'shared_event'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :events
  resources :messages
  resources :answers
  resources :conversations, only: [:index, :show]
  resources :notifications, only: [:index]

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

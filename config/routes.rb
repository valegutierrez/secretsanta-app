Rails.application.routes.draw do
  get 'notifications/index'
  get 'welcome/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :events
  get 'create_conversations/:id', controller: 'events', action: 'create_conversations', as: 'create_conversations'
  resources :conversations, only: [:index, :show]
  resources :notifications, only: [:index]

  root to: 'welcome#index'

  get 'shared_event/:code', controller: 'events', action: 'shared_event'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

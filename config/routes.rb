Rails.application.routes.draw do
  resources :answers
  resources :attendances, only: [:edit, :update]
  resources :conversations, only: [:index, :show]
  resources :events
  resources :messages

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  get 'create_conversations/:id', controller: 'events', action: 'create_conversations', as: 'create_conversations'
  get 'shared_event/:code', controller: 'events', action: 'shared_event'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

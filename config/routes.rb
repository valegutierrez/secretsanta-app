Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, :controllers => { :omniauth_callback => "users/omniauth_callbacks" }
  resources :events

  root to: 'welcome#index'

  get 'conversations/index'
  get 'conversations/show'
  get 'shared_event/:code', controller: 'events', action: 'shared_event'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

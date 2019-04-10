Rails.application.routes.draw do
  resources :events
  get 'shared_event/:code', controller: 'events', action: 'shared_event'
  devise_for :users
  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

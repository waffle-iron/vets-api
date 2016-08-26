Rails.application.routes.draw do

  # cors preflight routes:
  match '/v0/*path', to: 'application#cors_preflight', via: [:options]

  get '/saml/metadata', to: 'saml#metadata'
  get '/auth/saml/callback', to: 'v0/sessions#saml_callback', module: 'v0'
  post '/auth/saml/callback', to: 'v0/sessions#saml_callback', module: 'v0'

  namespace :v0, defaults: {format: 'json'} do
    resource :sessions, only: [:new, :destroy] do
      get :saml_callback, to: 'sessions#saml_callback'
      get 'current', to: 'sessions#show'
    end

    get 'user', to: 'users#show'
    get 'profile', to: 'users#show'

    get 'welcome', to: 'example#welcome', as: :welcome
    get 'status', to: 'admin#status'
  end

  root 'v0/example#index', module: 'v0'
end

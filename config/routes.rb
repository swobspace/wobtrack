Rails.application.routes.draw do
  mount Wobauth::Engine, at: '/auth'

  resources :tracks do
    resources :trackpoints
  end

  root 'tracks#index'
end

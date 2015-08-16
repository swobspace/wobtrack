Rails.application.routes.draw do
  mount Wobauth::Engine, at: '/auth'

  resources :trackpoints
  resources :tracks

  root 'tracks#index'
end

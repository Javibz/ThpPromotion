Rails.application.routes.draw do

  root 'home#etudiants'
  get '/chomeurs', to: 'home#chomeurs'
  get '/actifs', to: 'home#actifs'
  get 'save_scrapp/generate'

  get '/test', to: 'test#index'

  get '/send_nl', to: 'test#send_nl'


  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


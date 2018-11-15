Rails.application.routes.draw do
  get 'save_scrapp/generate'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

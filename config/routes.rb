Rails.application.routes.draw do
  root 'home#index'

  post 'fetch_data', to: 'home#fetch'
end

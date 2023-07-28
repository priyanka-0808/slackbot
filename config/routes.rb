Rails.application.routes.draw do
  namespace :api do
    post 'slack_messages', to: 'slack_messages#create'
    resources :slack_messages, only: [:index]
  end
end

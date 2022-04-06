Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
 
  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
    resources :reports, only: [:index, :create]
  end
end

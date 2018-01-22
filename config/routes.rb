Rails.application.routes.draw do

  root "events#index"

  namespace :event do
    resources :activities
  end
  namespace :event do
    namespace :activity do
      resources :participations
    end
  end
  namespace :entity do
    resources :organizations
  end
  namespace :entity do
    resources :people
  end
  namespace :event do
    namespace :activity do
      resources :postulations
    end
  end
  resources :venues
  namespace :event do
    resources :participations
  end
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  devise_for :users
  root "events#index"

  namespace :event do
    resources :activities
    resources :participations

    namespace :activity do
      resources :participations
      resources :postulations
    end
  end

  namespace :entity do
    resources :organizations
    resources :people
  end

  resources :venues
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

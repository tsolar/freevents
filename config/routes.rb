Rails.application.routes.draw do

  namespace :venue do
    resources :rooms
  end
  devise_for :users
  root "events#index"

  namespace :entity do
    resources :organizations
    resources :people
  end

  resources :venues
  resources :events do

    # these routes are for receiving postulations for event activities
    namespace :activities do
      resources :postulations, controller: "/event/activity_postulations" do
        member do
          post :approve
        end
      end
    end

    resources :participations, controller: "event/participations"
    resources :activities, controller: "event/activities" do
      # resources :participations
      resources :postulations, controller: "event/activity/postulations" # , except: [:new, :create, :destroy, :index]
    end


    member do
      put :respond_attendance
    end
  end

  resources :tickets, only: [:show], param: :token do
    member do
      get :scan
      get :print
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

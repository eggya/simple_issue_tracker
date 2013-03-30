SimpleIssueTracker::Application.routes.draw do

  resources :tickets, :only => [:new,:create]
  match '/:token' => 'tickets#show_my_ticket', :as => :show_my_ticket

  devise_for :admins

  namespace :admin do
    resources :ticket_statuses
    resources :ticket_histories

    resources :tickets, :except => [:new,:create,:destroy] do
      member do
        put :update_status
        put :update_admin
      end
    end

    root :to => "tickets#index"
  end

  root :to => "tickets#new"
end

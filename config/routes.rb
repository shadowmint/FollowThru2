FollowThru2::Application.routes.draw do

  root :to => "home#index"

  authenticated :user do
    root :to => 'home#index'

    # Resources
    resources :v_projects,     :path => "edit/projects",     :as => :v_projects
    resources :v_payments,     :path => "edit/payments",     :as => :v_payments
    resources :v_pledge_types, :path => "edit/pledge_types", :as => :v_pledge_types
    resources :v_pledges,      :path => "edit/pledges",      :as => :v_pledges
    resources :v_goals,        :path => "edit/goals",        :as => :v_goals
    resources :v_assets,       :path => "edit/assets",       :as => :v_assets

    match 'edit' => 'home#edit', :as => :edit
  end

  devise_for :users
  resources :users, :only => [:show, :index]
end

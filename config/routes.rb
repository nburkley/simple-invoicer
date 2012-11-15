SimpleInvoicer::Application.routes.draw do

  resources :clients, :only => [:new, :create, :edit, :update, :destroy, :index]

  devise_for :users

  resources :users do
    resource :profile, :only => [:show, :edit, :update]
  end

  resources :invoices

  resource :home

  namespace :api do
    resources :invoices
    resource :current_user, :only => [:show]
    resources :currency_types, :only => [:index]
    resources :quantity_types, :only => [:index]
  end

  match "profile" => "Profiles#edit"

  root :to => "home#index"

end

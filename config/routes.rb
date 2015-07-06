Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  resources :locations
  root to: 'locations#index'
end

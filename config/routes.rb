Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    controllers: 'users/registrations'
  }
  
  root to: 'homes#index'

  resources :patients

  namespace :doctor do
    get 'registered_patients_by_days', to: 'patients#registered_patients_by_days', as: 'patients_by_days'
    resources :patients, only: [:index]
  end
end

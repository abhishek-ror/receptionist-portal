Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root to: 'homes#index'

  resources :patients
  get 'registered_patients_by_days', to: 'patients#registered_patients_by_days'
end

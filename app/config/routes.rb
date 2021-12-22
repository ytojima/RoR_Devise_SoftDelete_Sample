Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end

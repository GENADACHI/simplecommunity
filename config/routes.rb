Rails.application.routes.draw do
  root to: 'top#index'
  get 'top/index'
  get 'top/login_check'
  devise_for :members
  resources :discussions do
  resources :comments, only: %i(new create update)
  end
  resources :comments, only: %i(show destroy edit)
end

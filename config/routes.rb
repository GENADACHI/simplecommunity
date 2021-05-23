Rails.application.routes.draw do
  get 'notifications/index'
  root to: 'top#index'
  get 'top/index'
  get 'top/login_check'
  devise_for :members
  resources :discussions do
    resources :comments
    resource :likes, only: [:create, :destroy]
  end
  resources :comments do
    resources :answers
    resource :likes, only: [:create, :destroy]
  end

end

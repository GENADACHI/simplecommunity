Rails.application.routes.draw do
  get 'notifications/index'
  root to: 'top#index'
  get 'top/index'
  get 'top/login_check'
  devise_for :members
  get 'member/show'
  resources :discussions do
    resources :comments
 end
end

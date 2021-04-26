Rails.application.routes.draw do
  root to: 'top#index'
  get 'top/index'
  get 'top/login_check'
  devise_for :members
  resources :discussions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

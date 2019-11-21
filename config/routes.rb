Rails.application.routes.draw do
  get 'public/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
  get 'cookie-policy', to: 'public#cookie_policy'
  post 'saw_cookie_notice', to: 'public#saw_cookie_notice'
end

Rails.application.routes.draw do
  root to: 'public#index'

  get 'public/index'
  get 'contact-us', to: 'public#contact_us'
  get 'privacy-policy', to: 'public#privacy_policy'
  get 'cookie-policy', to: 'public#cookie_policy'
  post 'saw_cookie_notice', to: 'public#saw_cookie_notice'
end

Rails.application.routes.draw do
  root to: 'public#index'

  get 'public/index'
  get 'contact-us', to: 'public#contact_us'
  get 'cookie-policy', to: 'public#cookie_policy'
  get 'disclosure-ccpa', to: 'public#disclosure_ccpa'
  get 'privacy-policy', to: 'public#privacy_policy'
  get 'terms-of-use', to: 'public#terms_of_use'
  
  post 'saw_cookie_notice', to: 'public#saw_cookie_notice'
end

Rails.application.routes.draw do
  devise_for :users
  # Public Controller
  # get 'public/index'
  match 'contact-us', to: 'public#contact_us', via: [:get, :post]

  get 'cookie-policy', to: 'public#cookie_policy'
  get 'disclosure-ccpa', to: 'public#disclosure_ccpa'
  get 'faq', to: 'public#faq'
  get 'privacy-policy', to: 'public#privacy_policy'
  get 'terms-of-use', to: 'public#terms_of_use'
  post 'saw_cookie_notice', to: 'public#saw_cookie_notice'
  get 'contact_requests', to: 'contact_requests#index'

  # Default root path
  root to: 'public#index'
end

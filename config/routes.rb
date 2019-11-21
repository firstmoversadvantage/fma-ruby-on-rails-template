Rails.application.routes.draw do
  get 'public/index'
  get 'privacy-policy', to: 'public#privacy_policy'
  get 'terms-of-use', to: 'public#terms_of_use'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'public/index'
  get 'contact-us', to: 'public#contact_us'
  get 'privacy-policy', to: 'public#privacy_policy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

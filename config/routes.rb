Rails.application.routes.draw do
  get 'public/index'
  get 'disclosure-ccpa', to: 'public#disclosure_ccpa'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

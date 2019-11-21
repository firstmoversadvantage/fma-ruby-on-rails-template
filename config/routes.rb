Rails.application.routes.draw do
  get 'public/index'
  get 'faq', to: 'public#faq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

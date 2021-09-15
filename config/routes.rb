# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users

  # Free Sidekiq
  if Gem.loaded_specs.key? 'sidekiq'
    require 'sidekiq'
    require 'sidekiq/web'
  end

  # Sidekiq Pro
  # if Gem.loaded_specs.key? 'sidekiq-pro'
  #   require 'sidekiq-pro'
  #   require 'sidekiq/pro/web'
  # end

  # Only admins can see the Sidekiq Dashboard
  authenticate :user, ->(u) { u.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :contact_requests, path: 'contact-requests', only: [:index]
  get 'contact-us', to: 'contact_requests#new', as: 'contact_us'
  post 'contact-us', to: 'contact_requests#create'

  # Public Controller
  get 'cookie-policy', to: 'public#cookie_policy'
  get 'faq', to: 'public#faq'
  get 'privacy-policy-california', to: 'public#privacy_policy_california'
  get 'privacy-policy', to: 'public#privacy_policy'
  get 'terms-of-use', to: 'public#terms_of_use'
  post 'saw_cookie_notice', to: 'public#saw_cookie_notice'

  # Default root path
  root to: 'public#index'

  match '*path', via: :all, to: 'public#not_found'
end

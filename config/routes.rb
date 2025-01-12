require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users

  devise_for :admin_users,
             ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :goals do
      namespace :done do
        post :index
        post :show
        post :many
      end
    end
  end

  namespace :manager do
    resources :candidatures
    resources :job_simulations
    resources :stacks
    resources :companies
    resources :job_simulations

    resource :profile, except: :new do
      collection do
        get 'complete_registration'
      end
    end

    resources :candidatures
    resources :goals
    namespace :goals do
      namespace :done do
        post :index
        post :show
        post :many
      end
    end

    get '', to: 'home#index', as: :home
  end

  scope module: :external do
    get '', to: 'home#index', as: :home
    get 'stimulus', to: 'home#stimulus', as: :stimulus
  end
end
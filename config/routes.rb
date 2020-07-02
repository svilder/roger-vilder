Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    get 'films', to: 'pages#films', as: :films
    get 'texts', to: 'pages#texts', as: :texts
    resources :works, only: [:index, :show]
  end
end

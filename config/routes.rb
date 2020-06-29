Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: :about
    resources :works, only: [:index, :show]
  end
end

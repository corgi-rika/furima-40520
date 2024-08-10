Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create  #コメント機能を追加
  end
end

Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

root to: 'public/homes#top'
get  'homes/guide'  => "public/homes#guide", as: 'guide'

scope module: :public do
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get '/customers/check' => 'customers#check'
  resources :customers, only: [:edit, :update, :destroy]
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :create, :update, :destroy]
end
  
namespace :admin do
  root to: 'homes#top'
  resources :customers
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :items, only: [:new, :index, :create, :edit, :update, :destroy, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

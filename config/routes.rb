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
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
  resources :cart_items, only:[:index, :create, :update, :destroy]
  get '/orders/thanks' => 'orders#thanks'
  post '/orders/confirm' => 'orders#confirm'
  get 'orders/confirm' => 'orders#error'
  resources :orders, only: [:new, :create, :index, :show]
end

namespace :admin do
  root to: 'homes#top'
  resources :customers, only: [:index, :show, :update]
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :items, only: [:new, :index, :create, :edit, :update, :destroy, :show]
  resources :orders, only: [:index, :show, :update] do
    resources :order_details, only: [:update]
  end
  resources :information, only: [:index, :show, :create, :edit, :update, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

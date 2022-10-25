Rails.application.routes.draw do

  # 顧客用
  # URL /end_users/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'

    resources :items,only:[:new, :index, :show, :edit, :create, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    get 'items/download/:id' => 'items#idownload', as: "image_download"
    get 'items/download/:id' => 'items#vdownload', as: "video_download"

    resources :favorites,only:[:index]

    resources :cart_items,only:[:create, :index, :update, :destroy]
    get '/cart_items/destroy_all' => "cart_items#destroy_all"

    get "/orders/thanks" =>"orders#thanks"
    post "/orders/confirm" =>"orders#confirm"
    resources :orders,only:[:new, :index, :show, :edit, :create, :update]

    resources :end_users,only:[:show, :edit, :create, :update]
    get '/end_users/:id/unsubscribe' => "end_users#unsubscribe", as: "unsubscribe"
    patch '/end_users/:id/withdrawal' => "end_users#withdrawal", as: "withdrawal"
  end

  namespace :admin do
    get '/' => "homes#top"
    resources :items,only:[:index, :show, :edit, :update]
    resources :genres,only:[ :index, :edit, :create, :update]
    resources :categories,only:[ :index, :edit, :create, :update]
    resources :orders,only:[:show, :index, :update]
    resources :end_users,only:[:show, :index, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

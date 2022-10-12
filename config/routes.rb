Rails.application.routes.draw do
 
  # 顧客用
  # URL /end_users/sign_in ...
  devise_for :end_users, controllers: {
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
    resources :items,only:[:new, :index, :show, :edit, :create, :update]
    resources :cart_items,only:[:create, :index, :update, :destroy]
      get '/cart_items/destroy_all' => "cart_items#destroy_all"
    resources :orders,only:[:create, :index, :new, :edit, :update,:show]
      get "/orders/thanks" =>"orders#thanks"
      post "/orders/confirm" =>"orders#confirm"
  end
  
  namespace :admin do
    get '/' => "homes#top"
    resources :items,only:[:index, :show, :edit, :update]
    resources :genres,only:[ :index, :edit, :create, :update]
    resources :categories,only:[ :index, :edit, :create, :update]
    resources :orders,only:[:show, :index, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

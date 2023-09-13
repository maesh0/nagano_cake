Rails.application.routes.draw do

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

root to: 'public/homes#top'

get "/about" => "public/homes#about"

get "/items" => "public/items#index"

get "/items/:id" => "public/items#show"


#public
#get "customers/my_page" => "public/customers#show"

#get "customers/information/edit" => "public/customers#edit"

#patch "customers/information" => "public/customers#update"
#public

#get "public/customers/unsubscribe" => "public/customers#unsubscribe"

scope module: :public do

  resources :items, only: %i[index show]

  get "customers/my_page" => "customers#show"

  get "customers/information/edit" => "customers#edit"

  patch "customers/information" => "customers#update"

  #退会確認画面
  get "customers/unsubscribe" => "customers#unsubscribe"

  #論理削除用のルーティング
  patch "customers/withdrawal/" => "customers#withdrawal"

  
  
end

namespace :admin do

  root to: 'homes#top'

  resources :items, only: %i[index new create show edit update]
  
  resources :customers, only: %i[index show edit update]

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

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

get "customers/my_page" => "public/customers#show"


namespace :customers do

end

namespace :admin do

  root to: 'homes#top'

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

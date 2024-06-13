Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  resource :users, only:[:show, :edit, :index]
  resource :books, only:[:show, :edit, :index]
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

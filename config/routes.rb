Rails.application.routes.draw do
  root 'homes#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :index, :edit, :update]
  resources :diaries
  resources :picture_books
end

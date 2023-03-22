Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords] ,controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  root to: 'homes#top'

  namespace :admin do

    root to: 'homes#top'
    get '/admin' => "homes#top",as: "admin"

    resources :comments,only: [:destroy]
    resources :cars,only: [:show,:destroy]
    resources :users,only: [:index,:show,:update]

  end

end

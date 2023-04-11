Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords] ,controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  resources :guest_sessions, only: [:new, :create]

  root to: 'homes#top'

  namespace :admin do

    root to: 'homes#top'

    resources :comments,only: [:destroy]
    resources :cars,only: [:show,:destroy]
    resources :users,only: [:index,:show,:update]

  end

  scope module: :user do

    #get '/post_user' => 'infos#post_user'
    #get '/post_user/:id' => 'infos#post_user'
    get '/mypage' => "infos#show"
    patch '/mypage' => 'infos#update'
    get '/info/edit' => "infos#edit"
    get '/confirm' => 'infos#confirm'
    patch '/withdrawal' => 'infos#withdrawal'
    get "liked_cars", to: "infos#liked_cars"

    get '/mypost' => "cars#mypost"

    resources :cars,only: [:create,:destroy,:new,:edit,:update,:index,:show] do
      resources :comments,only: [:create,:destroy]
      resource :likes,only: [:create,:destroy]
    end

  end


end

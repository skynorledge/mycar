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

    resources :comments,only: [:destroy]
    resources :cars,only: [:show,:destroy]
    resources :users,only: [:index,:show,:update]

  end

  scope module: :user do

    #get '/mypage' => "users#show"
    get '/info/edit' => "users#edit"
    get '/confirm' => 'users#confirm'
    patch '/withdrawal' => 'users#withdrawal'

    resources :infos,only: [:update,:show]
    resources :likes,only: [:index,:create,:destroy]

    resources :cars,only: [:create,:destroy,:new,:edit,:update,:index,:show] do
      resources :comments,only: [:create,:destroy]
    end

  end

end

Rails.application.routes.draw do

  get 'homes/top'
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords] ,controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  root to: 'homes#top'

end

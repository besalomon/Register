Rails.application.routes.draw do
  root 'courses#index'
  get "/courses", to:'courses#index'
  get "/signup", to:'users#new'
  post "/users", to: 'users#create'
  get "/courses/departments/:id", to: 'courses#show_department'
  get "/courses/new", to:'courses#new'
  get "/courses/rosters", to:'courses#rosters'
  patch "/courses/rosters", to:'courses#update_roster'
  get "/courses/:id", to:'courses#show'
  post "/courses/:id", to:'courses#registration'
  get "/courses/:id/edit", to: 'courses#edit'
  patch "/courses/:id", to: 'courses#update'
  delete "/courses/:id", to: 'courses#destroy'
  get "courses/:id/cancel", to: 'courses#cancel_registration'
  delete "/courses/:id/cancel", to: 'courses#cancel_registration'
  get "/login", to:'sessions#new'
  post "/login", to:'sessions#create'
  delete "/logout", to:'sessions#destroy'
  post "/courses", to:'courses#create'
  get"/dashboard", to:'users#home'
  get "students", to:'students#index'
  patch "rosters", to:'student_courses#update'
  get "settings", to:'users#settings'
  get "profile", to:'users#profile'
  get "profile/edit", to:'users#edit' 
  patch "profile/edit", to:'users#update'
  resources :courses do
  collection { post :import }
  end
  resources :departments
  resources :rooms
  namespace :api do
    namespace :v1 do
      get "/courses", to: 'courses#index'
    end
  end
end

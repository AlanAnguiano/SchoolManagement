Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "students#index"

  resources :students do
    get '/courses', to: 'students#show_courses'
    get '/courses/assign', to: 'students#current_courses'
    post '/courses/assign', to: 'students#assign_courses'
    delete '/courses/:course_id', to: 'students#remove_course', as: :course
  end
  resources :grades
  resources :courses
end

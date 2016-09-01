Rails.application.routes.draw do

  root 'welcome#index'
  
  get 'enrollments/new'
  post 'enrollments/new' => 'enrollments#create', as: :enrollments

  get 'class_rooms/'     => 'class_rooms#index'

  resources :students
  resources :courses  
end

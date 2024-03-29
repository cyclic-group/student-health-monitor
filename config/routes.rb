Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'sessions#new'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'

  get 'student/home', to: 'students#show_home', as: 'student_home'
  get 'student/messages', to: 'students#show_messages', as: 'student_messages'
  get 'student/report', to: 'students#new_report', as: 'student_report'
  get 'student/account', to: 'students#show_account', as: 'student_account'
  post 'student/report', to: 'students#create_report'
  get 'student/message/:id', to: 'students#show_message', as: 'student_message'

  get 'doctor/home', to: 'doctor#show_home', as: 'doctor_home'
  get 'doctor/message', to: 'doctor#new_message', as: 'doctor_message'
  post 'doctor/message', to: 'doctor#create_message'

  get 'admin/home', to: 'admin#show_home', as: 'admin_home'
  get 'admin/announcement', to: 'admin#new_announcement', as: 'admin_announcement'
  post 'admin/announcement', to: 'admin#create_announcement'
  get 'admin/password', to: 'admin#edit_password', as: 'admin_password'
  post 'admin/password', to: 'admin#update_password'
end

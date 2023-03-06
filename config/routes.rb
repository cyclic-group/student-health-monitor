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

end

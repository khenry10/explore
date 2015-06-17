Rails.application.routes.draw do
  devise_for :users
  
  get 'todo/index'
  resources :todos

  authenticated :user do
  root :to => 'todos#index', :as => :authenticated_root
end
root :to => redirect('/users/sign_in')

end

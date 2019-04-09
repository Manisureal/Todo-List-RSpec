Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'todo_lists#index'
  get '/todo_lists/:id', to: 'todo_lists#show'
end

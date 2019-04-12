Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'todo_lists#index'
  get 'todo_lists/new', to: 'todo_lists#new'
  post 'todo_lists', to: 'todo_lists#create'
  get '/todo_lists/:id', to: 'todo_lists#show', as: 'todo_list'
  get '/todo_lists/:id/edit', to: 'todo_lists#edit'
  patch '/todo_lists/update', to: 'todo_lists#update'
  delete 'todo_lists/:id', to: 'todo_lists#destroy'
end

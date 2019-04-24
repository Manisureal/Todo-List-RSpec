Rails.application.routes.draw do

  get 'index', to: 'todo_lists#index'
  get 'todo_lists/new', to: 'todo_lists#new'
  post 'todo_lists', to: 'todo_lists#create'
  get '/todo_lists/:id', to: 'todo_lists#show', as: 'todo_list'
  get '/todo_lists/:id/edit', to: 'todo_lists#edit', as: 'edit_todo_list'
  patch '/todo_lists/update', to: 'todo_lists#update', as: 'update_todo_list'
  delete 'todo_lists/:id', to: 'todo_lists#destroy', as: 'delete_todo_list'

  post '/todo_list_items', to: 'todo_list_items#create'
  get  '/todo_list_items/new', to: 'todo_list_items#new', as: 'new_todo_list_item'
  get    '/todo_list_items/:id/edit', to: 'todo_list_items#edit', as: 'edit_todo_list_item'
  get    '/todo_list_items/:id', to: 'todo_list_items#show', as: 'todo_list_item'
  patch  '/todo_list_items/:id', to: 'todo_list_items#update'
  put    '/todo_list_items/:id', to: 'todo_list_items#update'
  delete '/todo_list_items/:id', to: 'todo_list_items#destroy'
end

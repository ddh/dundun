Rails.application.routes.draw do
  resources :todo_lists do
    # So that items only exist under a to do list. They can't exist without a list.
    resources :todo_items
  end

  root 'todo_lists#index'
end

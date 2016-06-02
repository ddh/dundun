Rails.application.routes.draw do
  resources :todo_lists do
    # So that items only exist under a to do list. They can't exist without a list.
    resources :todo_items do

      # For each member (item) of the list, patch (update) with :complete
      member do
        patch :complete

      end
    end
  end

  root 'todo_lists#index'
end

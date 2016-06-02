class TodoItemsController < ApplicationController

  # Before doing anything with an item on todolist, get its associated todolist
  before_action :set_todo_list

  before_action :set_todo_item, except: :create

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    # After creating an item, redirect to the list (before_action sets @todo_list)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = 'Todo item was deleted'
    else
      flash[:error] = 'Todo item was could not be deleted'
    end
    # Reroute back to todo list after deletion
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: 'Todo item completed'
  end

  private

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  # Setting to-do list
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end


  # Setting the to-do items params
  def todo_item_params
    params[:todo_item].permit(:content)
  end
end

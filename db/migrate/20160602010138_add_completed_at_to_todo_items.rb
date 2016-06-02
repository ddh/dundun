class AddCompletedAtToTodoItems < ActiveRecord::Migration
  # Adding completed at column to an item. Datetime datatype.
  def change
    add_column :todo_items, :completed_at, :datetime
  end
end

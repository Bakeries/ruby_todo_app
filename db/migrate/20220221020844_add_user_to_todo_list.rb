class AddUserToTodoList < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists, :user_id, :integer
  end
end

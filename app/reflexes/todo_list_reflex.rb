# frozen_string_literal: true

class TodoListReflex < ApplicationReflex
  def delete
    # Deleting todo_list with all its content
    todo_list = TodoList.find(element.dataset[:id])
    todo_list.destroy
  end
end

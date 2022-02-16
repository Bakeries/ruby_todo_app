class TodoList < ApplicationRecord
  has_many :todo_items

  def percent_complete
    # Will return 0 to prevent division with 0
    return 0 if total_items == 0
    # returning percentage of completed items
    (100 * completed_items.to_f / total_items).round(1)
  end

  def completed_items
    # Getting value from variable or if is null calculate it
    @completed_items ||= todo_items.completed.count
  end

  def total_items
    # Get value from variable or if is null calculate it
    @total_items ||= todo_items.count
  end
end

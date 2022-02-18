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

  def status
    # Returning status value based on percentage_complete
    case percent_complete.to_i
    when 0
      'Not started'
    when 100
      'Complete'
    else
      'In progress'
    end
  end

  def badge_color
    # Returning badge_color value based on percentage_complete
    case percent_complete.to_i
    when 0
      'dark'
    when 100
      'success'
    else
      'primary'
    end
  end
end

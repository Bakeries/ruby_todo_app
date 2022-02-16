class TodoItem < ApplicationRecord
  belongs_to :todo_list

  # Database query.
  scope :completed, -> do
    where(completed: true)
  end
end

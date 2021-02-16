class Todo < ApplicationRecord

  belongs_to :user

  def overdue? ; (Date.today > due_date) end

  def due_today? ; (Date.today == due_date) end

  def due_later? ; (Date.today < due_date) end

  def completed? ; completed end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    todo
  end

  def to_displayable_string
    ret_str = "#{id}. "
    ret_str += completed ? "[X] " : "[ ] "
    ret_str += "#{todo_text}"
    ret_str += due_today? ? "" : " #{due_date}"
  end
end

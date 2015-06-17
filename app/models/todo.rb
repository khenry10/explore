class Todo < ActiveRecord::Base

  belongs_to :user

  def self.complete ids
      ids.each do |id|
        current_todo = Todo.find(id)
        current_todo.update(Complete: true)
      end
  end

end

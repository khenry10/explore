class AddUserIdToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :user
  end
end

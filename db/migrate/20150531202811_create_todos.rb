class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :Priority
      t.string :Action
      t.text :Description
      t.time :Time_Estimate
      t.time :Time_Spent
      t.boolean :Complete
      t.date :Deadline

      t.timestamps null: false
    end
  end
end

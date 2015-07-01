class TodosController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    completed_todos_ids = params[:todos_ids]
    Todo.complete(completed_todos_ids) 
    @todo = current_user.todos.where(Complete: nil)
    
  end

  def nil.each
    puts "hey"
  end

  def new
    @todo = Todo.new
  end
  
  def update
    @todo = Todo.find params[:id]
    @todo.update todo_params

    redirect_to todos_path
  end

  def show
    @todo = Todo.order(:Priority)
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save 
      redirect_to todos_path
    else
      render 'new'
    end
  end
  
  def edit
    @todo = Todo.find params[:id]
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy

    redirect_to todos_path
  end

  def complete
    @todo = Todo.find params[:id]
    @odo.update(:Compelete => "true")
  end

  private  
  def todo_params
   params.require('todo').permit(:Priority, :Action, :Description, :Time_Estimate, :Deadline)
  end

end

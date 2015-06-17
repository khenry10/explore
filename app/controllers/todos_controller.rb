class TodosController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @todo = current_user.todos.all

    
  
  end

  def new
    @todo = Todo.new
  end
  
  def update
    @todo = Todo.find params[:id]
    @todo.update todo_params

    redirect_to todos_path
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

  private  
  def todo_params
   params.require('todo').permit(:Action, :Description, :Time_Estimate, :Deadline)
  end

end

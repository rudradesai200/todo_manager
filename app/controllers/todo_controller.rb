class TodoController < ApplicationController
  skip_before_action :authorized, only: [:list, :show, :new, :create, :edit, :update, :delete, :mark_complete ,:mark_not_complete]

  def list
    @todos = current_user.todos
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    @todo.user = current_user
    if @todo.save
      redirect_to :action => 'list'
    else
      @todos = current_user.todos.all
      render :action => 'new'
    end
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def update
    todo = current_user.todos.find(params[:id])
    if todo.update(todo_update_params)
      redirect_to :action => 'show', :id => todo
    else
      render :action => 'edit'
    end
  end

  def delete
    current_user.todos.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def todo_params
    params.permit(:todo_text, :due_date)
  end

  def todo_update_params
    params.require(:todo).permit(:todo_text, :due_date)
  end

  def mark_complete
    @todo = current_user.todos.find(params[:id])
    @todo.completed = true
    if @todo.save
      redirect_to :action => 'show', :id => @todo
    else
      redirect_to :action => "list"
    end
  end

  def mark_not_complete
    @todo = current_user.todos.find(params[:id])
    @todo.completed = false
    if @todo.save
      redirect_to :action => 'show', :id => @todo
    else
      redirect_to :action => "list"
    end
  end
end

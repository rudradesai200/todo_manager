class TodoController < ApplicationController
  def list
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    if @todo.save
      redirect_to :action => 'list'
    else
      @todos = Todo.all
      render :action => 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_update_params)
      redirect_to :action => 'show', :id => todo
    else
      render :action => 'edit'
    end
  end

  def delete
    Todo.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def todo_params
    params.permit(:todo_text, :due_date)
  end

  def todo_update_params
    params.require(:todo).permit(:todo_text, :due_date)
  end

  def mark_complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    if @todo.save
      redirect_to :action => 'show', :id => @todo
    else
      redirect_to :action => "list"
    end
  end

  def mark_not_complete
    @todo = Todo.find(params[:id])
    @todo.completed = false
    if @todo.save
      redirect_to :action => 'show', :id => @todo
    else
      redirect_to :action => "list"
    end
  end
end

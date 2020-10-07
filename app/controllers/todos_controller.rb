class TodosController < ApplicationController

  before_action :set_variable, only: [:show, :edit, :update]


  def new
    @todo = Todo.new
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo successfully updated"
    else
      render "edit"
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo created successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

  def set_variable
    @todo = Todo.find(params[:id])
  end

end
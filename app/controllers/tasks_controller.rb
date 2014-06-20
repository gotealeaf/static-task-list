class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Task created'
      redirect_to @task
    else
      flash[:alert] = 'Task not created'
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      flash[:notice] = 'Task updated'
      redirect_to @task
    else
      flash[:alert] = 'Task not updated'
      render :edit
    end      
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task deleted'
    redirect_to @task
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end

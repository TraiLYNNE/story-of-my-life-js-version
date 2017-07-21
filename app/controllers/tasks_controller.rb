class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new(page_id: params[:page_id])
  end

  def create
    @task = Task.new(task_params)

    if @task.valid?
      @task.save

      redirect_to page_path(@task.page), alert: "Task successfully created"
    else
      render :new
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to page_path(@task.page), alert: "Task successfully deleted"
  end

  private

  def task_params
    params.require(:task).permit(:name, :page_id)
  end
end

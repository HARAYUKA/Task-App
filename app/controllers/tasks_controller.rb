class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = @user.tasks.order(created_at: :desc)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    @task.save
    redirect_to user_tasks_url
  end
  
  def show
  end
  
  private
  
    def task_params
      params.require(:task).permit(:name, :description)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
end
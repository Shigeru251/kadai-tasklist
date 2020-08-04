class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end 
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスク が正常に登録されました'
      redirect_to @task
      
    else
      flash.now[:danger] = 'タスク が登録されませんでした'
      render :new
      
    end
  end 
  
  def new 
    @task = Task.new()
  end 
  
  def edit
  end 
  
  def show 
    @task = Task.find(params[:id])
  end 
  
  def update 
  end 
  
  def destroy
  end 

private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end  
end

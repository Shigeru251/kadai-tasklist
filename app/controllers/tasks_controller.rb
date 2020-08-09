class TasksController < ApplicationController
 # before_action :require_user_logged_in,except: [:index]
 before_action :require_user_logged_in
  
  def index
    
#   @tasks = Task.all.page(params[:page]).per(10)
    @tasks = @current_user.tasks.page(params[:page]).per(10)
  end 
  
  def create
#    @task = Task.new(task_params)
    @task = @current_user.tasks.build(task_params)
    
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
    @task = Task.find(params[:id])
  end 
  
  def show 
#    @task = Task.find(params[:id])
    @task = @current_user.tasks.find_by(id: params[:id])
    unless @task
      session[:user_id] = nil

      redirect_to login_url
    
    end
  end 
  
  def update 
#    @task = Task.find(params[:id])
    @task = @current_user.tasks.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end 
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスク は正常に削除されました'
    redirect_to tasks_url

  end 

private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end  
end

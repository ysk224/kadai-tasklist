class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end
  
  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = '新規のタスクが正常に追加されました'
      redirect_to @task
    else
      @task = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = '新規のタスクを追加してください'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクを更新してください'
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to root_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end

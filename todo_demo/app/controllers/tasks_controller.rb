class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @todo= Task.all;
    @task= Task.new
    respond_to do |format|
      format.html
      format.json do
        render :json => {:tasks => @todo.map(&:to_json) }
      end
    end
  end

  def show
  end

  # GET /users/1/edit
  def edit

  end

  def create
    @task= Task.new;
    @task['name'] =params[:name]; 
    @task['detail'] =params[:detail]; 
    @task['status']=params[:status].nil? ? 0 : params[:status];;
    if @task.save
      flash[:success] = "Register success"
      redirect_to tasks_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end

  def update
    @task_id= task_attributes;
    respond_to do |format|
      if @task.update(task_attributes)
        format.html { redirect_to @task, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.error, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task=  Task.find(params[:id]);
    @task.destroy;
     respond_to do |format|
      format.html { redirect_to(tasks_path) }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_attributes
    params.require(:task).permit(:name, :detail, :status)
  end
end

class TasksController < ApplicationController
before_filter :authenticate
before_filter :fetch_task_for_user, :only => [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index

    @tasks = Task.find_all_by_user_id(@user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @user.tasks.build(params[:task])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
     @task = @user.tasks.new
     @task.task_name = params[:task][:task_name]
     @task.performed_on = params[:task][:performed_on]
     @task.hours = params[:task][:hours]
     @task.notes = params[:task][:notes]
     project = Project.find_by_name(params[:task][:project_name])
     @task.project = project

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
     @task.task_name = params[:task][:task_name]
     @task.performed_on = params[:task][:performed_on]
     @task.hours = params[:task][:hours]
     @task.notes = params[:task][:notes]
     project = Project.find_by_name(params[:task][:project_name])
     @task.project = project

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render json: @task }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end


  protected

  def authenticate
    if !current_user
        authenticate_or_request_with_http_basic('Login') do |username, password|
             @user = User.find_by_email(username)
             @user && @user.authenticate(password)
         end
    else
      @user = current_user
    end
  end

  def fetch_task_for_user
    @task = Task.find(:first, :conditions => {:user_id => @user.id, :id => params[:id]})
  end


end

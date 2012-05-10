class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :destroy]

  #shortcut for getting all timesheets for this user only
  def timesheets
    @user = User.find(params[:id])
    @timesheet_entries = @user.timesheet_entries

    respond_to do |format|
      format.html { render @timesheet_entries }  #todo: add view
      format.json { render json: @timesheet_entries }
    end

  end

  def show
    @user = User.find(params[:id])
    @timesheet_entries = @user.timesheet_entries.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Duff Time Card app!"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

  def signed_in_user

#    respond_to do |format|
#      format.html {
#        unless signed_in?
#          store_location
#          redirect_to signin_path, notice: "Please sign in."
#        end
#      }
#      format.json { render :nothing => true, :status => :unauthorized }
#    end

    unless signed_in?
     #render :nothing => true, :status => :unauthorized
      store_location
      redirect_to signin_path, notice: "Please sign in."

    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(notadmin_path) unless current_user?(@user) || current_user.admin?
  end

  def admin_user
    redirect_to(notadmin_path) unless current_user.admin?
  end

end

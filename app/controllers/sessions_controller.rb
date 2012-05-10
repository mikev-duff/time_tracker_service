class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    # logger.debug "#{email}:#{password}"
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or tasks_path
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
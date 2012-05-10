module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token || user_from_http_basic_auth
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  private

  def user_from_remember_token
    #we can optionally pass in ?auth_token=<token> as a URL parameter instead of using cookie
    remember_token = cookies[:remember_token] || params[:auth_token]
    #logger.debug "remember_token: #{remember_token}"
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def check_http_basic_auth
    auth = request.authorization
    if auth == nil
      #not using basic auth
      return true
    end
    username, password = ::Base64.decode64(request.authorization.split(' ', 2).last || '').split(/:/, 2)

    logger.debug "#{username}, #{password}"
    user = User.find_by_email(username)
    if user && user.authenticate(password)
      logger.debug "authenticated!!"
      return true
    end
    return false
  end

  def user_from_http_basic_auth
    auth = request.authorization
    if auth == nil
      #not using basic auth
      return nil
    end
    username, password = ::Base64.decode64(request.authorization.split(' ', 2).last || '').split(/:/, 2)

    logger.debug "#{username}, #{password}"
      user = User.find_by_email(username)
      if user && user.authenticate(password)
        logger.debug "authenticated!!"
        return user
      end
    #return nil

    #authenticate_or_request_with_http_basic('Administration') do |username, password|
    #  username == 'admin' && password == 'password'
    #end

    #authenticate_or_request_with_http_basic('Administration') do |username, password|
    #  logger.debug "#{username}, #{password}"
    #  user = User.find_by_email(params[:session][:email])
    #  if user && user.authenticate(params[:session][:password])
    #    logger.debug "authenticated!!"
    #    return user
    #  end
    #end
  end

  def clear_return_to
    session.delete(:return_to)
  end
end

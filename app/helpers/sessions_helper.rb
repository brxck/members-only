module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent.signed[:remember_token] = user.remember_token
  end

  def forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def log_out
    session.delete(:user_id)
    forget
  end

  def logged_in?
    !current_user.nil?
  end
end

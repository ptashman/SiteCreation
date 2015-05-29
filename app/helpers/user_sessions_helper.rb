module UserSessionsHelper

  def user_sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def user_signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token  = User.digest(cookies[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless user_signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def user_sign_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:user_remember_token)
    self.current_user = nil
  end

  def user_redirect_back_or(default)
    redirect_to(session[:user_return_to] || default)
    session.delete(:user_return_to)
  end

  def store_location
    session[:user_return_to] = request.url if request.get?
  end
end

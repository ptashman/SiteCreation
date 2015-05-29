module SessionsHelper

  def sign_in(owner)
    remember_token = Owner.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    owner.update_attribute(:remember_token, Owner.digest(remember_token))
    self.current_owner = owner
  end

  def signed_in?
    !current_owner.nil?
  end

  def current_owner=(owner)
    @current_owner = owner
  end

  def current_owner
    remember_token  = Owner.digest(cookies[:remember_token])
    @current_owner ||= Owner.find_by(remember_token: remember_token)
  end

  def current_owner?(owner)
    owner == current_owner
  end

  def signed_in_owner
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    current_owner.update_attribute(:remember_token,
                                  Owner.digest(Owner.new_remember_token))
    cookies.delete(:remember_token)
    self.current_owner = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end

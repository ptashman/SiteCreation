class UserSessionsController < ApplicationController

  def new
  end

  def create
    @site = Site.find(params[:site_id])
    user = @site.users.find_by(email: params[:user_session][:email].downcase)
    if user && user.authenticate(params[:user_session][:password])
      user_sign_in user
      user_redirect_back_or site_user_url(id: user.id)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    user_sign_out
    redirect_to site_welcome_url(id: params[:site_id])
  end
end
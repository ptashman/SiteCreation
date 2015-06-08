class UserSessionsController < ApplicationController
  before_action :set_site_by_subdomain, only: [:new, :create]

  def new
  end

  def create
    user = @site.users.find_by(email: params[:user_session][:email].downcase)
    if user && user.authenticate(params[:user_session][:password])
      user_sign_in user
      user_redirect_back_or user_url(id: user.id)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    user_sign_out
    redirect_to root_path
  end
end
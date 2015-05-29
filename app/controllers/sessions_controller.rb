class SessionsController < ApplicationController

  def new
  end

  def create
    owner = Owner.find_by(email: params[:session][:email].downcase)
    if owner && owner.authenticate(params[:session][:password])
      sign_in owner
      redirect_back_or owner
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
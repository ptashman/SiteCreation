class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UserSessionsHelper

  before_filter :sign_out_misplaced_users

  def sign_out_misplaced_users
    user_sign_out if current_user and current_user.site != Site.find_by_id(params[:site_id])
  end
end

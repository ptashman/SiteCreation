class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UserSessionsHelper

  before_filter :sign_out_misplaced_users

  def sign_out_misplaced_users
    user_sign_out if current_user && current_user.site != Site.where(subdomain: request.try(:subdomain)).first
  end
  
  def set_site_by_subdomain
    @site = Site.where(subdomain: request.try(:subdomain)).first
  end
end

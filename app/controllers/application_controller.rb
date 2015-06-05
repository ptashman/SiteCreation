class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UserSessionsHelper
  include ApplicationHelper

  before_filter :sign_out_misplaced_users
  before_filter :set_site_by_site_id

  def sign_out_misplaced_users
    user_sign_out if current_user && current_user.site != Site.find_by_id(params[:site_id])
  end

  def set_site_by_site_id
    @site = Site.find(params[:site_id]) if site? && params[:site_id]
  end
end

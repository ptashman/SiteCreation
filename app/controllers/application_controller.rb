class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
=begin
  before_filter :sign_out_misplaced_users

  def sign_out_misplaced_users
    user_sign_out if current_user and current_user.site != Site.find_by_id(params[:site_id])
  end
=end
end

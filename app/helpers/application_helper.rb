module ApplicationHelper
  def site?
    site_pages = [["users", "new"], ["users", "index"], ["users", "show"], ["users", "edit"],
     ["posts", "index"], ["user_sessions", "new"], ["sites", "welcome"]]
    current_page = [params[:controller], params[:action]]
    site_pages.include?(current_page)
  end
end

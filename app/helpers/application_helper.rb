module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Site Generation"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def site?
    site_pages = [["users", "new"], ["users", "index"], ["users", "show"], ["users", "edit"],
     ["microposts", "index"], ["user_sessions", "new"], ["sites", "welcome"]]
    current_page = [params[:controller], params[:action]]
    site_pages.include?(current_page)
  end
end

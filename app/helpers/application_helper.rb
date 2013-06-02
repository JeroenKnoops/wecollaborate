module ApplicationHelper
  
  def full_title(page_title)
    base_title = "WeCollaborate"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def body_id
    @css_body_id ? @css_body_id : "#{params[:controller].parameterize}_controller"
  end
end
